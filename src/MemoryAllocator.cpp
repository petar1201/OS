//
// Created by petar on 15/8/23.

#include "../h/MemoryAllocator.hpp"

MemoryAllocator::FreeMem *MemoryAllocator::head = nullptr;

size_t MemoryAllocator::roundToNumOfBlocks(size_t size) {
    size_t sz = size / MEM_BLOCK_SIZE;
    if (size % MEM_BLOCK_SIZE != 0)
        sz++;
    return sz;
}

void MemoryAllocator::init() {
    head = (FreeMem *) ((char*)HEAP_START_ADDR + ((char *) HEAP_END_ADDR - (char *) HEAP_START_ADDR)/8 + 1);
    head->next = nullptr;
    head->size = ((char *) HEAP_END_ADDR - (char *) HEAP_START_ADDR)/8*2;
}

void *MemoryAllocator::malloc(size_t sz) {
    size_t size = sz * MEM_BLOCK_SIZE;
    FreeMem *blk = head, *prev = nullptr;
    for (; blk != nullptr; prev = blk, blk = blk->next)
        if (blk->size >= size) break;
    if (blk == nullptr) {
        return nullptr;
    }
    size_t remainingSize = blk->size - size;
    if (remainingSize >= sizeof(FreeMem) + MEM_BLOCK_SIZE) {
        blk->size = size;
        size_t offset = sizeof(FreeMem) + size;
        FreeMem *newBlk = (FreeMem *) ((char *) blk + offset);
        if (prev) prev->next = newBlk;
        else head = newBlk;
        newBlk->next = blk->next;
        newBlk->size = remainingSize - sizeof(FreeMem);
    } else {
        if (prev) prev->next = blk->next;
        else head = blk->next;
    }
    blk->next = nullptr;
    return (char *) blk + sizeof(FreeMem);
}

int MemoryAllocator::tryToJoin(FreeMem *cur) {
    if (!cur) return 0;
    if (cur->next && (char *) cur + cur->size == (char *) (cur->next)) {
        cur->size += cur->next->size;
        cur->next = cur->next->next;
        return 1;
    } else
        return 0;
}

int MemoryAllocator::free(void *addr) {
    if(addr == nullptr)return -1;
    if(addr< (char*)HEAP_START_ADDR || addr>(char*)HEAP_END_ADDR)return -1;
    FreeMem *header = (FreeMem *) ((char *) addr - sizeof(FreeMem));
    FreeMem *curr;
    if (!head || header < head)
        curr = 0;
    else
        for (curr = head; curr->next != 0 && header > curr->next; curr = curr->next);
    FreeMem *newSeg = header;
    newSeg->size = header->size;
    if (curr) newSeg->next = curr->next;
    else newSeg->next = head;
    if (curr) curr->next = newSeg;
    else head = newSeg;
    tryToJoin(newSeg);
    tryToJoin(curr);
    return 0;
}