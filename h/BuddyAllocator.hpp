//
// Created by Petar Markovic on 5.8.23.
//

#ifndef OS_BUDDYALLOCATOR_HPP
#define OS_BUDDYALLOCATOR_HPP



#include "../lib/hw.h"
#include "../lib/console.h"
#include "../test/printing.hpp"


class BuddyAllocator {
private:
    constexpr static int BLOCK_SIZE=4096;

    typedef struct FreeMem {
        FreeMem* next;
        size_t size;
        //FreeMem* buddy;
    }FreeMem;

    static FreeMem**entrys;
    static int NUM_OF_ENTRYS;


    static void* start;
    static FreeMem* get(int i);
    static void split(FreeMem* seg, int upper, int lower);
    static void put(int i, FreeMem* adr);

    static void tryToMerge(int i);

    static void tryToJoin();
    static int degreeOfTwo(size_t size);
public:
    static bool is2(size_t sz);
    static size_t findNearest2(size_t sz);
    static void init(void* startAdr, size_t size);
    static void* buddy_alloc(size_t size);
    static void buddy_free(void* adr);
    static void printEntrys();
};



#endif //OS_BUDDYALLOCATOR_HPP
