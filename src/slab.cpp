//
// Created by os on 2/8/23.
//
#include "../h/slab.hpp"
kmem_cache_t *kmem_cache_create(const char *name, size_t size,
                                void (*ctor)(void *),
                                void (*dtor)(void *)){
    return Cache::init(name, size, ctor, dtor);
}

int kmem_cache_shrink(kmem_cache_t *cachep){
    return Cache::shrink(cachep);
}

void *kmem_cache_alloc(kmem_cache_t *cachep){
    return Cache::alloc(cachep);
}

void kmem_cache_free(kmem_cache_t *cachep, void *objp){
    Cache::free(cachep, objp);
}

void *kmalloc(size_t size){
    return Cache::allocSmallBuff(size);
}

void kfree(void *objp){
    return Cache::deallocSmallBuff(objp);
}

void kmem_cache_destroy(kmem_cache_t *cachep){
    return Cache::destroy(cachep);
}
void kmem_cache_info(kmem_cache_t *cachep){
    return Cache::printCache(cachep);
}

int kmem_cache_error(kmem_cache_t *cachep){
    return 0;
}