//
// Created by Petar Markovic on 6.8.23..
//


#include "../h/SlabAllocator.hpp"
#include "../h/BuddyAllocator.hpp"

SlabAllocator* SlabAllocator::init(size_t sz) {
    SlabAllocator* sb;
    int N = 0;
    while(((1<<N)*BLOCK_SIZE)/(sz+sizeof(FreeMem))<20){
        N++;
    }
    sb = (SlabAllocator*)BuddyAllocator::buddy_alloc((1<<N)*BLOCK_SIZE-(((1<<N)*BLOCK_SIZE)%(sz+sizeof(FreeMem)))+sizeof(SlabAllocator));
    if(sb == nullptr)return nullptr;
    sb->sizeOfObj = sz;
    sb->sizeOfSlab = (1<<BuddyAllocator::findNearest2((1<<N)*BLOCK_SIZE-(((1<<N)*BLOCK_SIZE)%(sz+sizeof(FreeMem)))+sizeof(SlabAllocator)))*BLOCK_SIZE;
    sb->numOfObjs = (sb->sizeOfSlab - sizeof(SlabAllocator))/(sz+sizeof(FreeMem));
    sb->head = (FreeMem*)((char*)sb+sizeof(SlabAllocator));
    //head->prev = nullptr;
    sb->head->allocated = false;
    sb->next = nullptr;
    sb->head->next = (FreeMem*)((char*)(sb->head)+(sb->sizeOfObj+sizeof(FreeMem)));
    FreeMem*temp = sb->head->next;
    //   FreeMem* prev = head;
    for(int i = 1; i < sb->numOfObjs-1; i++){
        temp->allocated = false;
        temp->next = (FreeMem*)((char*)(temp)+(sb->sizeOfObj+sizeof(FreeMem)));
        //     temp->prev = prev;
        //   prev = temp;
        temp = temp->next;
    }
    temp->next = nullptr;
    return sb;
}

void *SlabAllocator::slab_alloc(SlabAllocator* sb) {
    FreeMem* temp = sb->head;
    while(true){
        if(temp == nullptr)break;
        else{
            if(!temp->allocated){
                temp->allocated=true;
                return (void*)((char*)temp+sizeof(FreeMem));
            }
            temp = temp->next;
        }
    }
    return nullptr;
}

int SlabAllocator::slab_free(SlabAllocator*sb,void *adr) {
    FreeMem* seg = (FreeMem*)((char*)(adr)-sizeof(FreeMem));
    FreeMem* temp = sb->head;
    while(1){
        if(temp == nullptr)return -1;
        else{
            if(temp == seg){
                temp->allocated = false;
                return 0;
            }
            temp = temp->next;
        }
    }
}

size_t SlabAllocator::getSizeOfSlab(SlabAllocator *sb) {
    return sb->sizeOfSlab;
}

bool SlabAllocator::isSlabEmpty(SlabAllocator *sb) {
    FreeMem*temp = sb->head;
    while(true){
        if(temp == nullptr)return true;
        else{
            if(temp->allocated){
                return false;
            }
            temp = temp->next;
        }
    }
}

void SlabAllocator::doDestructors(SlabAllocator *sb, void (*dtor)(void *)) {
    FreeMem*temp = sb->head;
    while(true){
        if(temp == nullptr)return;
        else{
            if(temp->allocated){
                if(dtor)dtor((void*)((char*)(temp)+sizeof(FreeMem)));
            }
            temp = temp->next;
        }
    }
}

bool SlabAllocator::isSlabFull(SlabAllocator *sb) {
    FreeMem*temp = sb->head;
    while(true){
        if(temp == nullptr)return true;
        else{
            if(!temp->allocated){
                return false;
            }
            temp = temp->next;
        }
    }
}

int SlabAllocator::numOfAllocatedObjs(SlabAllocator *sb) {
    FreeMem*temp = sb->head;
    int i = 0;
    while(true){
        if(temp == nullptr)return i;
        else{
            if(temp->allocated){
                i++;
            }
            temp = temp->next;
        }
    }
}

size_t SlabAllocator::getNumOfObjsInSlab(SlabAllocator *sb) {
    return sb->numOfObjs;
}

SlabAllocator *SlabAllocator::initBuff(size_t sz, size_t N) {
    SlabAllocator* sb;
    sb = (SlabAllocator*)BuddyAllocator::buddy_alloc(sz);
    if(sb == nullptr)return nullptr;
    sb->sizeOfObj = sz;
    sb->sizeOfSlab = (1<<N)*BLOCK_SIZE;
    sb->numOfObjs = (sb->sizeOfSlab - sizeof(SlabAllocator))/(sz+sizeof(FreeMem));
    sb->head = (FreeMem*)((char*)sb+sizeof(SlabAllocator));
    //head->prev = nullptr;
    sb->head->allocated = false;
    sb->next = nullptr;
    sb->head->next = (FreeMem*)((char*)(sb->head)+(sb->sizeOfObj+sizeof(FreeMem)));
    FreeMem*temp = sb->head->next;
    //   FreeMem* prev = head;
    for(int i = 1; i < sb->numOfObjs-1; i++){
        temp->allocated = false;
        temp->next = (FreeMem*)((char*)(temp)+(sb->sizeOfObj+sizeof(FreeMem)));
        //     temp->prev = prev;
        //   prev = temp;
        temp = temp->next;
    }
    temp->next = nullptr;
    return sb;
}
