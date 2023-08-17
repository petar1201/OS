//
// Created by os on 2/11/23.

#include "../h/MemoryAllocator.hpp"

MemoryAllocator::FreeMem *MemoryAllocator::freeMemHead = nullptr;

size_t MemoryAllocator::roundToNumOfBlocks(size_t size) {
    size_t sz = size / MEM_BLOCK_SIZE;
    if (size % MEM_BLOCK_SIZE != 0)
        sz++;
    return sz;
}

void MemoryAllocator::init() {
    freeMemHead = (FreeMem *) ((char*)HEAP_START_ADDR + ((char *) HEAP_END_ADDR - (char *) HEAP_START_ADDR)/8 + 1);
    freeMemHead->next = nullptr;
    freeMemHead->size = ((char *) HEAP_END_ADDR - (char *) HEAP_START_ADDR)/8*2;
}

void *MemoryAllocator::malloc(size_t sz) {
    // Try to find an existing free block in the list (first fit):
   // size_t size = roundToNumOfBlocks(sz);
    size_t size = sz * MEM_BLOCK_SIZE;
    FreeMem *blk = freeMemHead, *prev = nullptr;
    for (; blk != nullptr; prev = blk, blk = blk->next)
        if (blk->size >= size) break;
    // If not found, allocate a new memory segment and add it to the list:
    if (blk == nullptr) {
        return nullptr;
    }
    // Allocate the requested block:
    size_t remainingSize = blk->size - size;
    if (remainingSize >= sizeof(FreeMem) + MEM_BLOCK_SIZE) {
        // A fragment remains
        blk->size = size;
        size_t offset = sizeof(FreeMem) + size;
        FreeMem *newBlk = (FreeMem *) ((char *) blk + offset);
        if (prev) prev->next = newBlk;
        else freeMemHead = newBlk;
        newBlk->next = blk->next;
        newBlk->size = remainingSize - sizeof(FreeMem);
    } else {
        // No remaining fragment, allocate the entire block
        if (prev) prev->next = blk->next;
        else freeMemHead = blk->next;
    }
    blk->next = nullptr;
    return (char *) blk + sizeof(FreeMem);
}

int MemoryAllocator::tryToJoin(FreeMem *cur) {
    if (!cur) return 0;
    if (cur->next && (char *) cur + cur->size == (char *) (cur->next)) {
        // Remove the cur->next segment:
        cur->size += cur->next->size;
        cur->next = cur->next->next;
        return 1;
    } else
        return 0;
}

int MemoryAllocator::free(void *address) {
    FreeMem *header = (FreeMem *) ((char *) address - sizeof(FreeMem));
    FreeMem *curr;
    if (!freeMemHead || header < freeMemHead)
        curr = 0;
    else
        for (curr = freeMemHead; curr->next != 0 && header > curr->next; curr = curr->next);
    FreeMem *newSeg = header;
    newSeg->size = header->size;
    if (curr) newSeg->next = curr->next;
    else newSeg->next = freeMemHead;
    if (curr) curr->next = newSeg;
    else freeMemHead = newSeg;
    tryToJoin(newSeg);
    tryToJoin(curr);
    return 0;
}
//