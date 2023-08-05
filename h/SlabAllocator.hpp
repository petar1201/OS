//
// Created by Petar Markovic on 6.8.23..
//

#ifndef OS_SLABALLOCATOR_HPP
#define OS_SLABALLOCATOR_HPP

#include "../lib/hw.h"

class SlabAllocator {
private:
    constexpr static int BLOCK_SIZE=4096;
    typedef struct FreeMem {
        FreeMem* next;
        //FreeMem* prev;
        bool allocated;
    }FreeMem;

    FreeMem*head;
    size_t sizeOfObj;
    int numOfObjs;
    size_t sizeOfSlab;

public:
    SlabAllocator* next;
    static SlabAllocator* init(size_t sz);
    static void* slab_alloc(SlabAllocator* sb);
    static int slab_free(SlabAllocator* sb,void* adr);
    static size_t getSizeOfSlab(SlabAllocator*sb);
    static bool isSlabEmpty(SlabAllocator* sb);
    static void doDestructors(SlabAllocator*sb, void (*dtor)(void *));
    static bool isSlabFull(SlabAllocator*sb);
    static int numOfAllocatedObjs(SlabAllocator* sb);
    static size_t getNumOfObjsInSlab(SlabAllocator*sb);
    static SlabAllocator* initBuff(size_t sz, size_t N);
};

#endif //OS_SLABALLOCATOR_HPP
