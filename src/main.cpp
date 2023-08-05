#include "../h/syscall_c.hpp"
#include "../test/userMain.hpp"
extern "C" void supervisorTrap();

void main(){
    MemoryAllocator::init();
    __asm__ volatile ("csrw stvec, %0" : :"r"(&supervisorTrap));

    thread_t mainThread;
    thread_create(&mainThread, nullptr, nullptr);
    KernelThread::running = mainThread;
    KernelThread::initIdle();
    KernelThread::initPut();
    KernelBuffer::createBuff();


    changeToUserMode();

    userMain();



    while(KernelBuffer::ulaz->getCnt()>0 || KernelBuffer::izlaz->getCnt()>0){
                while(KernelBuffer::ulaz->getCnt()>0)getc();
    }
}