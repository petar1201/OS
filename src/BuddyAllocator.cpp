//
// Created by Petar Markovic on 5.8.23.
//

#include "../h/BuddyAllocator.hpp"

BuddyAllocator::FreeMem** BuddyAllocator::entrys = nullptr;
void* BuddyAllocator::start=nullptr;
int BuddyAllocator::NUM_OF_ENTRYS=0;

void BuddyAllocator::init(void* startAdr, size_t size) {
    entrys = (FreeMem **) startAdr;
    NUM_OF_ENTRYS = degreeOfTwo(size);
    void *pocetak = (void *) ((char *) startAdr + NUM_OF_ENTRYS * sizeof(FreeMem *));
    start = pocetak;

    for (int i = 0; i < NUM_OF_ENTRYS; i++)entrys[i] = nullptr;
    entrys[NUM_OF_ENTRYS - 1] = (FreeMem *) (pocetak);
    entrys[NUM_OF_ENTRYS - 1]->size = ((1 << (NUM_OF_ENTRYS - 1)) * BLOCK_SIZE);
    entrys[NUM_OF_ENTRYS - 1]->next = nullptr;
}

void *BuddyAllocator::buddy_alloc(size_t size) {
    size_t numOfBlocks = findNearest2(size);
    if(numOfBlocks > (size_t)NUM_OF_ENTRYS)return nullptr;//exception;
    for(int current = numOfBlocks; current < NUM_OF_ENTRYS; current++){
        FreeMem* p = get(current);
        if(!p)continue;//split(p,16,0)
        split(p, current, numOfBlocks);
        return (void*)((char*)p+sizeof(FreeMem));
    }

    return nullptr;
}

void BuddyAllocator::buddy_free(void *adr) {
    if(!adr)return;
    FreeMem* seg = (FreeMem*)(((char*)(adr))-sizeof(FreeMem));
    size_t numOfBlocks = seg->size/BLOCK_SIZE;
    size_t i = 0;
    size_t two=1;
    while(1){
        if(two == numOfBlocks) break;
        i++;
        two*=2;
    }
    put(i, seg);
    tryToJoin();
}

BuddyAllocator::FreeMem *BuddyAllocator::get(int i) {
    FreeMem* head = entrys[i];
    if(head == nullptr)return nullptr;
    entrys[i]=head->next;
    return head;
}

void BuddyAllocator::split(BuddyAllocator::FreeMem *seg, int upper, int lower) {
    //bool wasIn = false;
    while (--upper>=lower) {
        //  wasIn=true;
        put(upper, (FreeMem *) ((char *) seg + (1 << upper) * BLOCK_SIZE));
        //((FreeMem *) ((char *) seg + (1 << upper) * BLOCK_SIZE))->buddy=seg;
    }
    seg->size=(1<<lower)*BLOCK_SIZE;
    //if(wasIn)seg->buddy = ((FreeMem *) ((char *) seg + (1 << lower) * BLOCK_SIZE));
}

void BuddyAllocator::put(int i, BuddyAllocator::FreeMem *adr) {
    //size_t sizes=(1<<i)*BLOCK_SIZE;
    adr->size=(1<<i)*BLOCK_SIZE;
    FreeMem*head=entrys[i];
    FreeMem*temp, *prev;
    temp = head;
    if(temp)temp= head;
    else{
        entrys[i]=adr;
        entrys[i]->next = nullptr;
        return;
    }
    prev = temp;
    while(true){
        if(temp == nullptr)break;
        else{
            if(adr < temp){
                if(temp == head){
                    adr->next = head;
                    entrys[i] = adr;
                }
                else{
                    prev->next = adr;
                    adr->next = temp;
                }
                return;
            }
            prev = temp;
            temp=temp->next;
        }
    }
    prev->next = adr;
    prev->next->next=nullptr;
}

void BuddyAllocator::tryToJoin() {
    for(int i = 0; i < NUM_OF_ENTRYS; i++){
        tryToMerge(i);
    }
}

void BuddyAllocator::tryToMerge(int i) {
    FreeMem*head=entrys[i];
    if(!head)return;
    FreeMem*temp = head->next;
    FreeMem*prev = head;
    FreeMem*prevPrev = head;
    while(true){
        if(temp == nullptr)return;
        else{
            if(((char*)prev+((1<<i)*BLOCK_SIZE))==((char*)temp)
               && ((long long)(((char*)prev+((1<<i)*BLOCK_SIZE)+((1<<i)*BLOCK_SIZE))-(char*)start))%((1<<(i+1))*BLOCK_SIZE)==0
               && ((long long)(((char*)temp+((1<<i)*BLOCK_SIZE)+((1<<i)*BLOCK_SIZE))-(char*)start))%((1<<(i+1))*BLOCK_SIZE)!=0){//&&prev->buddy == temp && temp->buddy == prev){//merge
                // prev->buddy=((FreeMem *) ((char *) prev + (1 << (i+1)) * BLOCK_SIZE));
                put(i+1, prev);
                if(prev == head){
                    head = temp->next;
                    entrys[i] = head;
                }
                else{
                    prevPrev->next = temp->next;
                }
                prev = temp->next;
                if(prev)temp = prev->next;
                else return;
            }
            else{
                prevPrev = prev;
                prev = temp;
                temp = temp->next;
            }
        }
    }

}

void BuddyAllocator::printEntrys() {
    for(int i = 0; i < NUM_OF_ENTRYS; i++){
        if(entrys[i] == nullptr){
            printString("entrys[");
            printInt(i);
            printString("] = nullptr\n");
        }
        else{
            FreeMem*head=entrys[i];
            FreeMem*temp = head;
            int j = 0;
            while(true){
                if(temp == nullptr)break;
                else{
                    printString("entrys[");
                    printInt(i);
                    printString("][");
                    printInt(j++);
                    printString("] = ");
                    printInt((char*)((void*)(temp))-(char*)((void*)(0)));
                    //printInt(1);
                    printString(", ");
                    //printString("ZASTO");
                    temp = temp->next;
                    //printString("NECES");
                }
            }
            //printString("Adasdsadasdasdas");
            printString("\n");
        }
    }
}

size_t BuddyAllocator::findNearest2(size_t sz) {
    size_t numOfBlocks;
    size_t size = sz + sizeof(FreeMem);
    numOfBlocks = size/BLOCK_SIZE;
    if(size%BLOCK_SIZE!=0)numOfBlocks++;
    while(true){
        if(is2(numOfBlocks))break;
        numOfBlocks++;
    }
    size_t i = 0;
    size_t two=1;
    while(1){
        if(two == numOfBlocks) break;
        i++;
        two*=2;
    }
    return i;
}

bool BuddyAllocator::is2(size_t sz) {
    size_t n = sz;
    while (1){
        if (n == 1) break;
        if (n % 2 != 0) {
            return false;
        }
        n /= 2;
    }
    return true;
}




int BuddyAllocator::degreeOfTwo(size_t size){
    int counter = 0;
    int myS = size;
    while(myS != 1){
        counter++;
        myS = myS / 2;
    }
    return counter;
}


