#include "../h/syscall_c.hpp"
#include "../test/printing.hpp"

void *mem_alloc(size_t size) {
    size_t sz = MemoryAllocator::roundToNumOfBlocks(size);


    __asm__ volatile ("mv a1, %0"::"r"(sz));
    __asm__ volatile ("li a0, 0x01");

    __asm__ volatile ("ecall");

    void *ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));

    return ret;
}

int mem_free(void * addr) {
    __asm__ volatile ("mv a1, %0"::"r"(addr));
    __asm__ volatile ("li a0, 0x02");

    __asm__ volatile ("ecall");

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));

    return ret;
}

int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    if(handle==nullptr)return -1;
    uint64* s = (uint64*)Cache::alloc(Cache::stackCache);

    __asm__ volatile("mv a5, %0"::"r"(1));
    __asm__ volatile ("mv a4, %0"::"r"(s));
    __asm__ volatile ("mv a3, %0"::"r"(arg));
    __asm__ volatile ("mv a2, %0"::"r"(start_routine));
    __asm__ volatile ("mv a1, %0"::"r"(handle));
    __asm__ volatile ("li a0, 0x11");

    __asm__ volatile ("ecall");

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));

    return ret;
}

int thread_exit() {
    __asm__ volatile ("li a0, 0x12");

    __asm__ volatile ("ecall");

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));

    return ret;
}

void thread_dispatch() {
    __asm__ volatile ("li a0, 0x13");
    //printString("Ovde1\n");
    __asm__ volatile ("ecall");
    //printString("Ovde2\n");
}

int sem_open(sem_t *handle, unsigned init) {

    __asm__ volatile ("mv a2, %0"::"r"(init));
    __asm__ volatile ("mv a1, %0"::"r"(handle));
    __asm__ volatile ("li a0, 0x21");

    __asm__ volatile ("ecall");

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));

    return ret;
}

int sem_close(sem_t handle) {
    __asm__ volatile ("mv a1, %0"::"r"(handle));

    __asm__ volatile ("li a0, 0x22");

    __asm__ volatile ("ecall");

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));

    return ret;
}

int sem_wait(sem_t id) {

    __asm__ volatile ("mv a1, %0"::"r"(id));
    __asm__ volatile ("li a0, 0x23");

    __asm__ volatile ("ecall");

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));

    return ret;
}

int sem_signal(sem_t id) {

    __asm__ volatile ("mv a1, %0"::"r"(id));
    __asm__ volatile ("li a0, 0x24");

    __asm__ volatile ("ecall");

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));

    return ret;
}

int time_sleep(time_t time) {
    __asm__ volatile ("mv a1, %0"::"r"(time));
    __asm__ volatile ("li a0, 0x31");

    __asm__ volatile ("ecall");

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));

    return ret;
}
char getc() {
    __asm__ volatile ("li a0, 0x41");

    __asm__ volatile ("ecall");

    char ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));

    return ret;
}

void putc(char c) {
    __asm__ volatile ("mv a1, %0"::"r"(c));
    __asm__ volatile ("li a0, 0x42");

    __asm__ volatile ("ecall");

}

void changeToUserMode() {
    __asm__ volatile ("li a0, 0x51");

    __asm__ volatile ("ecall");
}

void changeToPrivilegedMode() {
    __asm__ volatile ("li a0, 0x52");

    __asm__ volatile ("ecall");
}

int thread_start(thread_t handle){
    __asm__ volatile ("mv a1, %0"::"r"(handle));
    __asm__ volatile ("li a0, 0x14");

    __asm__ volatile ("ecall");

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));

    return ret;
}

int thread_create_v2(thread_t *handle, void (*start_routine)(void *), void *arg) {
    if(handle==nullptr)return -1;
    uint64* s = (uint64*)Cache::alloc(Cache::stackCache);

    __asm__ volatile("mv a5, %0"::"r"(0));
    __asm__ volatile ("mv a4, %0"::"r"(s));
    __asm__ volatile ("mv a3, %0"::"r"(arg));
    __asm__ volatile ("mv a2, %0"::"r"(start_routine));
    __asm__ volatile ("mv a1, %0"::"r"(handle));
    __asm__ volatile ("li a0, 0x11");

    __asm__ volatile ("ecall");

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));

    return ret;
};
