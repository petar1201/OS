//
// Created by Petar Markovic on 6.8.23..
//


#include "../h/Cache.hpp"
#include "../h/BuddyAllocator.hpp"
#include "../test/printing.hpp"
#include "../lib/console.h"

Cache* Cache:: ch32 = nullptr;
Cache* Cache:: ch64= nullptr;
Cache* Cache:: ch128= nullptr;
Cache* Cache:: ch256= nullptr;
Cache* Cache:: ch512= nullptr;
Cache* Cache:: ch1024= nullptr;
Cache* Cache:: ch2048= nullptr;
Cache* Cache:: ch4096= nullptr;
Cache* Cache:: ch8192= nullptr;
Cache* Cache:: ch16384= nullptr;
Cache* Cache:: ch32768= nullptr;
Cache* Cache:: ch65536= nullptr;
Cache* Cache:: ch131072= nullptr;
Cache* Cache:: threadCache= nullptr;
Cache* Cache:: stackCache= nullptr;

Cache *Cache::init(const char *name, size_t size, void (*ctor)(void *), void (*dtor)(void *)) {
    Cache* ch;
    //INIT Cache From Buddy
    ch = (Cache*)BuddyAllocator::buddy_alloc(sizeof(Cache));
    if(!ch)return nullptr;
    ch->cacheName=name;
    ch->sizeOfObj=size;
    ch->constructor = ctor;
    ch->destructor = dtor;
    ch->headEmpty = SlabAllocator::init(size);
    ch->headEmpty->next=nullptr;
    ch->headFull=nullptr;
    ch->headMid=nullptr;
    return ch;
}

size_t Cache::deallocSlabList(SlabAllocator *sb) {
    SlabAllocator*temp = sb;
    size_t ret=0;
 /*   while(1){
        if(temp == nullptr)return ret;
        else{
            SlabAllocator*tr = temp;
            ret += SlabAllocator::getSizeOfSlab(temp);
            temp = temp->next;
          //  SlabAllocator::doDestructors(tr, destructor);
            //DONE PozoviDestrukoreZaSveObjekteKojiPostojeNaPloci --- Dodati fju za to u klasi SlabAllocator
            //DONE i samo prosledjivati fju destruktor
         //   BuddyAllocator::buddy_free(tr);
        }
    }*/
       BuddyAllocator::buddy_free(temp);
    return ret;

}

void Cache::destroy(Cache *ch) {
    ch->deallocSlabList(ch->headFull);
    ch->deallocSlabList(ch->headMid);
    ch->deallocSlabList(ch->headEmpty);
    BuddyAllocator::buddy_free(ch);
}

size_t Cache::shrink(Cache *ch) {
    if(ch->neededToResizeAfterLastShrink){
        ch->neededToResizeAfterLastShrink=false;
        return 0;
    }
    size_t ret = ch->deallocSlabList(ch->headEmpty);
    return ret/BLOCK_SIZE;
}

void *Cache::alloc(Cache *ch) {
    SlabAllocator *tempM,*tempE;
    tempM=ch->headMid;
    while(1){
        if(tempM==nullptr)break;
        else{
            void*tr = SlabAllocator::slab_alloc(tempM);
            if(tr){
                if(SlabAllocator::isSlabFull(tempM)){
                    if(ch->headFull==nullptr){
                        ch->headFull=tempM;
                        ch->headFull->next=nullptr;
                    }
                    else{
                        addIn(ch->headFull,tempM);
                    }
                    if(ch->headMid == tempM){
                        ch->headMid = nullptr;
                    }
                    else{
                        removeFrom(ch->headMid,tempM);
                    }
                }
                if(ch->constructor)ch->constructor(tr);
                return tr;
            }
            tempM=tempM->next;
        }
    }

    if(ch->headEmpty == nullptr){
        ch->neededToResizeAfterLastShrink=true;
        ch->headEmpty = SlabAllocator::init(ch->sizeOfObj);
        if(!ch->headEmpty)return nullptr;
        ch->headEmpty->next=nullptr;
        //REQUEST NEW SLAB
    }
    tempE=ch->headEmpty;
    void*tr = SlabAllocator::slab_alloc(ch->headEmpty);
    ch->headEmpty=ch->headEmpty->next;
    if(ch->headMid==nullptr){
        ch->headMid=tempE;
        ch->headMid->next=nullptr;
    }
    else{
        addIn(ch->headMid,tempE);
    }
    if(ch->constructor)ch->constructor(tr);
    return tr;

    //DONE Kreni od mid popunjeih, ubaci tu ako imea
    //DONE provera da li je postao skroz popunjen, ako jeste prebaciti ga u listu popunjeih
    //DONE ako nema nijedan u mid popunjen ici kroz listu praznih
    //DONE prazan prebaciti u  listu mid popunjen i postaviti flag resize na true
    //DONE izvrsiti konstruktor nad objektom?
}

bool Cache::free(Cache *ch, void *adr) {

    SlabAllocator*tempF = ch->headFull;
    SlabAllocator*tempM = ch->headMid;
    while(1){
        if(tempF == nullptr)break;
        else{
            int ret = SlabAllocator::slab_free(tempF, adr);
            if(ret == 0){
                if(tempF==ch->headFull){
                    ch->headFull=ch->headFull->next;
                }
                else{
                    removeFrom(ch->headFull, tempF);
                }
                if(ch->headMid==nullptr){
                    ch->headMid=tempF;
                    ch->headMid->next = nullptr;
                }
                else{
                    addIn(ch->headMid, tempF);
                }
                if(ch->destructor)ch->destructor(adr);
                return true;
            }
            tempF=tempF->next;
        }
    }

    while(1){
        if(tempM == nullptr)break;
        else{
            int ret = SlabAllocator::slab_free(tempM, adr);
            if(ret == 0){
                if(SlabAllocator::isSlabEmpty(tempM)) {
                    if (tempM == ch->headMid) {
                        ch->headMid = ch->headMid->next;
                    } else {
                        removeFrom(ch->headMid, tempM);
                    }
                    if (ch->headEmpty == nullptr) {
                        ch->headEmpty = tempM;
                        ch->headEmpty->next = nullptr;
                    } else {
                        addIn(ch->headEmpty, tempM);
                    }
                }
                if(ch->destructor)ch->destructor(adr);
                return true;
            }
            tempM=tempM->next;
        }
    }

    return false;

    /*DONE Kreni od Full popunjenih, ako ga ne nadjes nigde
     * predji na mid popunjene, ako ga ne nadjes nigde onda je greska
     * ako ga nadjes u full popunjeni prebaci iz te liste u listu mid popunjeni
     * ako ga nadjes u mid popunjeni proveriti da li je lista postala prazna
     * pre same dealokacije pozvadi destruktor nad objektom?*/
}

void Cache::printErrorMsg(Cache *ch) {
    //TODO Pitaj marka sta treba
}

void Cache::printCache(Cache *ch) {
    printString("Cache Name: ");
    printString(ch->cacheName);
    printString("\n");
    printString("Size of obj(Bytes): ");
    printInt(ch->sizeOfObj);
    printString("\n");
    size_t sz = 0;
    int i = 0;
    SlabAllocator*tr;
    tr = ch->headEmpty;
    while(tr){
        sz+=SlabAllocator::getSizeOfSlab(tr);
        i++;
        tr = tr->next;
    }
    tr = ch->headFull;
    while(tr){
        sz+=SlabAllocator::getSizeOfSlab(tr);
        i++;
        tr = tr->next;
    }
    tr = ch->headMid;
    while(tr){
        sz+=SlabAllocator::getSizeOfSlab(tr);
        i++;
        tr = tr->next;
    }
    printString("Size of cache(blocks): ");
    printInt(sz/BLOCK_SIZE);
    printString("\n");
    printString("Num of slabs: ");
    printInt(i);
    printString("\n");
    int numOfObjsPossible = 0;
    int numOfObjsAllocated = 0;
    tr = ch->headEmpty;
    i=-1;
    while(tr){
        i = SlabAllocator::getNumOfObjsInSlab(tr);
        numOfObjsPossible+=i;
        numOfObjsAllocated+=SlabAllocator::numOfAllocatedObjs(tr);
        tr = tr->next;
    }
    tr = ch->headFull;
    while(tr){
        i = SlabAllocator::getNumOfObjsInSlab(tr);
        numOfObjsPossible+=i;
        numOfObjsAllocated+=SlabAllocator::numOfAllocatedObjs(tr);
        tr = tr->next;
    }
    tr = ch->headMid;
    while(tr){
        i = SlabAllocator::getNumOfObjsInSlab(tr);
        numOfObjsPossible+=i;
        numOfObjsAllocated+=SlabAllocator::numOfAllocatedObjs(tr);
        tr = tr->next;
    }
    if(i!=-1){
        printString("Num of objs in a slab is ");
        printInt(i);
        printString("\n");
        printString("Percentage occupancy of cache is ");
        printInt((100*numOfObjsAllocated)/(numOfObjsPossible));//possible:100=alloc:x x = (100*alloc)/(possible)
        printString("\n");
    }

    /*DONE
     * Informacije koje se štampaju za jedan keš su ime, veličina jednog podatka izražena u
     * bajtovima, veličina celog keša izraženog u broju blokova, broj ploča, broj objekata u jednoj
     * ploči i procentualna popunjenost keša.*/
}

void Cache::addIn(SlabAllocator *head,SlabAllocator*add) {
    SlabAllocator*temp=head;
    SlabAllocator*prev = head;
    temp = temp->next;
    while(1){
        if(temp == nullptr)break;
        else{
            prev = temp;
            temp = temp->next;
        }
    }
    prev->next = add;
    add->next = nullptr;
}

void Cache::removeFrom(SlabAllocator *head,SlabAllocator*add) {
    SlabAllocator* temp, *prev;
    prev = head;
    temp =prev->next;
    while(1){
        if(temp == nullptr)break;
        else{
            if(add == temp){
                prev->next = temp->next;
                break;
            }
            prev = temp;
            temp = temp->next;
        };
    }

}

void Cache::initBuffs() {
    ch32= initOneBuff("ch32", 0, 32, nullptr, nullptr);
//    threadCache = initOneBuff("threadCache", 0, 64, nullptr, nullptr);

    ch64 = initOneBuff("ch64", 0, 64, nullptr, nullptr);
    threadCache = ch64;
    ch128 = initOneBuff("ch128", 0, 128, nullptr, nullptr);
    ch256 = initOneBuff("ch256", 0, 256, nullptr, nullptr);
    ch512 = initOneBuff("ch512", 0, 512, nullptr, nullptr);
    ch1024 = initOneBuff("ch1024",0, 1024, nullptr, nullptr);
    ch2048 = initOneBuff("ch2048",0, 2048, nullptr, nullptr);
    ch4096 = initOneBuff("ch4096",1, 4096, nullptr, nullptr);
//    stackCache = initOneBuff("stackCache",1, 4096, nullptr, nullptr);
    stackCache=ch4096;
    ch8192 = initOneBuff("ch8192",2, 8192, nullptr, nullptr);
    ch16384 = initOneBuff("ch16384",3, 16384, nullptr, nullptr);
    ch32768 = initOneBuff("ch32768",4, 32768, nullptr, nullptr);
    ch65536 = initOneBuff("ch65536",5, 65536, nullptr, nullptr);
    ch131072 = initOneBuff("ch131072",6, 131072, nullptr, nullptr);
}

Cache *Cache::initOneBuff(const char *name, size_t N, size_t size, void (*ctor)(void *), void (*dtor)(void *)) {
    Cache* ch;
    //INIT Cache From Buddy
    ch = (Cache*)BuddyAllocator::buddy_alloc(sizeof(Cache));
    if(!ch)return nullptr;
    ch->cacheName=name;
    ch->sizeOfObj=size;
    ch->constructor = ctor;
    ch->destructor = dtor;
    ch->headEmpty = SlabAllocator::initBuff(size, N);
    ch->headFull=nullptr;
    ch->headMid=nullptr;
    return ch;
}

size_t Cache::findNearest2(size_t n) {
    if(n<=32)return 32;
    size_t ret=n;
    while(!BuddyAllocator::is2(ret))ret++;
    return ret;
}

void *Cache::allocSmallBuff(size_t sz) {
    size_t s = findNearest2(sz);
    Cache*ch;
    if(s == 32)ch=ch32;
    else if(s == 64)ch=ch64;
    else if(s == 128)ch=ch128;
    else if(s == 256)ch=ch256;
    else if(s == 512)ch=ch512;
    else if(s == 1024)ch=ch1024;
    else if(s == 2048)ch=ch2048;
    else if(s == 4096)ch=ch4096;
    else if(s == 8192)ch=ch8192;
    else if(s == 16384)ch=ch16384;
    else if(s == 32768)ch=ch32768;
    else if(s == 65536)ch=ch65536;
    else ch = ch131072;
    return alloc(ch);
}

void Cache::deallocSmallBuff(void* p) {
    if(Cache::free(ch32,p))return;
    if(Cache::free(ch64,p))return;
    if(Cache::free(ch128,p))return;
    if(Cache::free(ch256,p))return;
    if(Cache::free(ch512,p))return;
    if(Cache::free(ch1024,p))return;
    if(Cache::free(ch2048,p))return;
    if(Cache::free(ch4096,p))return;
    if(Cache::free(ch8192,p))return;
    if(Cache::free(ch16384,p))return;
    if(Cache::free(ch32768,p))return;
    if(Cache::free(ch65536,p))return;
    if(Cache::free(ch131072,p))return;
}