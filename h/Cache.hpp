//
// Created by Petar Markovic on 6.8.23..
//

#ifndef OS_CACHE_HPP
#define OS_CACHE_HPP

#include "SlabAllocator.hpp"
class Cache {
private:
    constexpr static int BLOCK_SIZE=4096;
    using Body = void (*)(void*);
    const char *cacheName;
    size_t sizeOfObj;
    Body constructor;
    Body destructor;
    SlabAllocator* headFull;
    SlabAllocator* headEmpty;
    SlabAllocator* headMid;
    bool neededToResizeAfterLastShrink;
    size_t deallocSlabList(SlabAllocator*sb);
    static size_t findNearest2(size_t n);
public:
    static Cache* init(const char *name, size_t size,void (*ctor)(void *),void (*dtor)(void *));
    static Cache* initOneBuff(const char *name, size_t N, size_t size,void (*ctor)(void *),void (*dtor)(void *));
    static void initBuffs();
    static void destroy(Cache*ch);
    static size_t shrink(Cache* ch);
    static void* alloc(Cache*ch);
    static bool free(Cache* ch, void* adr);
    static void printErrorMsg(Cache*ch);
    static void printCache(Cache*ch);
    static void addIn(SlabAllocator*head, SlabAllocator*add);
    static void removeFrom(SlabAllocator*head,SlabAllocator*add);
    static void* allocSmallBuff(size_t sz);
    static void deallocSmallBuff(void * p);
    Cache:alloc(velicinu){};
    static Cache* ch32;
    static Cache* ch64;
    static Cache* ch128;
    static Cache* ch256;
    static Cache* ch512;
    static Cache* ch1024;
    static Cache* ch2048;
    static Cache* ch4096;
    static Cache* ch8192;
    static Cache* ch16384;
    static Cache* ch32768;
    static Cache* ch65536;
    static Cache* ch131072;
};


#endif //OS_CACHE_HPP
