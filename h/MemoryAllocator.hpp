//
// Created by petar on 15/8/23.
//

#ifndef PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"

class MemoryAllocator {
private:
    typedef struct FreeMem {
        FreeMem *next;
        size_t size;
    }FreeMem;

    static FreeMem* head;

    static int tryToJoin(FreeMem *cur);


public:
    static void init();

    static void *malloc(size_t size);

    static int free(void *address);

    static size_t roundToNumOfBlocks(size_t sz);
};

#endif //PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP