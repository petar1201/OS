
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	71813103          	ld	sp,1816(sp) # 80007718 <_GLOBAL_OFFSET_TABLE_+0x48>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	685030ef          	jal	ra,80003ea0 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <supervisorTrap>:
.extern handleRoutine
.global supervisorTrap
.align 4
supervisorTrap:
    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
    sd x\index, \index * 8 (sp)
    .endr
    80001004:	00013023          	sd	zero,0(sp)
    80001008:	00113423          	sd	ra,8(sp)
    8000100c:	00213823          	sd	sp,16(sp)
    80001010:	00313c23          	sd	gp,24(sp)
    80001014:	02413023          	sd	tp,32(sp)
    80001018:	02513423          	sd	t0,40(sp)
    8000101c:	02613823          	sd	t1,48(sp)
    80001020:	02713c23          	sd	t2,56(sp)
    80001024:	04813023          	sd	s0,64(sp)
    80001028:	04913423          	sd	s1,72(sp)
    8000102c:	04a13823          	sd	a0,80(sp)
    80001030:	04b13c23          	sd	a1,88(sp)
    80001034:	06c13023          	sd	a2,96(sp)
    80001038:	06d13423          	sd	a3,104(sp)
    8000103c:	06e13823          	sd	a4,112(sp)
    80001040:	06f13c23          	sd	a5,120(sp)
    80001044:	09013023          	sd	a6,128(sp)
    80001048:	09113423          	sd	a7,136(sp)
    8000104c:	09213823          	sd	s2,144(sp)
    80001050:	09313c23          	sd	s3,152(sp)
    80001054:	0b413023          	sd	s4,160(sp)
    80001058:	0b513423          	sd	s5,168(sp)
    8000105c:	0b613823          	sd	s6,176(sp)
    80001060:	0b713c23          	sd	s7,184(sp)
    80001064:	0d813023          	sd	s8,192(sp)
    80001068:	0d913423          	sd	s9,200(sp)
    8000106c:	0da13823          	sd	s10,208(sp)
    80001070:	0db13c23          	sd	s11,216(sp)
    80001074:	0fc13023          	sd	t3,224(sp)
    80001078:	0fd13423          	sd	t4,232(sp)
    8000107c:	0fe13823          	sd	t5,240(sp)
    80001080:	0ff13c23          	sd	t6,248(sp)

    csrw sscratch, sp
    80001084:	14011073          	csrw	sscratch,sp

    call handleRoutine
    80001088:	2c4010ef          	jal	ra,8000234c <handleRoutine>


    .irp index, 0,1,2,3,4,5,6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
     ld x\index, \index * 8 (sp)
    .endr
    8000108c:	00013003          	ld	zero,0(sp)
    80001090:	00813083          	ld	ra,8(sp)
    80001094:	01013103          	ld	sp,16(sp)
    80001098:	01813183          	ld	gp,24(sp)
    8000109c:	02013203          	ld	tp,32(sp)
    800010a0:	02813283          	ld	t0,40(sp)
    800010a4:	03013303          	ld	t1,48(sp)
    800010a8:	03813383          	ld	t2,56(sp)
    800010ac:	04013403          	ld	s0,64(sp)
    800010b0:	04813483          	ld	s1,72(sp)
    800010b4:	05013503          	ld	a0,80(sp)
    800010b8:	05813583          	ld	a1,88(sp)
    800010bc:	06013603          	ld	a2,96(sp)
    800010c0:	06813683          	ld	a3,104(sp)
    800010c4:	07013703          	ld	a4,112(sp)
    800010c8:	07813783          	ld	a5,120(sp)
    800010cc:	08013803          	ld	a6,128(sp)
    800010d0:	08813883          	ld	a7,136(sp)
    800010d4:	09013903          	ld	s2,144(sp)
    800010d8:	09813983          	ld	s3,152(sp)
    800010dc:	0a013a03          	ld	s4,160(sp)
    800010e0:	0a813a83          	ld	s5,168(sp)
    800010e4:	0b013b03          	ld	s6,176(sp)
    800010e8:	0b813b83          	ld	s7,184(sp)
    800010ec:	0c013c03          	ld	s8,192(sp)
    800010f0:	0c813c83          	ld	s9,200(sp)
    800010f4:	0d013d03          	ld	s10,208(sp)
    800010f8:	0d813d83          	ld	s11,216(sp)
    800010fc:	0e013e03          	ld	t3,224(sp)
    80001100:	0e813e83          	ld	t4,232(sp)
    80001104:	0f013f03          	ld	t5,240(sp)
    80001108:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    8000110c:	10010113          	addi	sp,sp,256
    sret
    80001110:	10200073          	sret
	...

0000000080001120 <_ZN12KernelThread13pushRegistersEv>:
.global _ZN12KernelThread13pushRegistersEv
.type _ZN12KernelThread13pushRegistersEv, @function
_ZN12KernelThread13pushRegistersEv:
    addi sp, sp, -256
    80001120:	f0010113          	addi	sp,sp,-256
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001124:	00313c23          	sd	gp,24(sp)
    80001128:	02413023          	sd	tp,32(sp)
    8000112c:	02513423          	sd	t0,40(sp)
    80001130:	02613823          	sd	t1,48(sp)
    80001134:	02713c23          	sd	t2,56(sp)
    80001138:	04813023          	sd	s0,64(sp)
    8000113c:	04913423          	sd	s1,72(sp)
    80001140:	04a13823          	sd	a0,80(sp)
    80001144:	04b13c23          	sd	a1,88(sp)
    80001148:	06c13023          	sd	a2,96(sp)
    8000114c:	06d13423          	sd	a3,104(sp)
    80001150:	06e13823          	sd	a4,112(sp)
    80001154:	06f13c23          	sd	a5,120(sp)
    80001158:	09013023          	sd	a6,128(sp)
    8000115c:	09113423          	sd	a7,136(sp)
    80001160:	09213823          	sd	s2,144(sp)
    80001164:	09313c23          	sd	s3,152(sp)
    80001168:	0b413023          	sd	s4,160(sp)
    8000116c:	0b513423          	sd	s5,168(sp)
    80001170:	0b613823          	sd	s6,176(sp)
    80001174:	0b713c23          	sd	s7,184(sp)
    80001178:	0d813023          	sd	s8,192(sp)
    8000117c:	0d913423          	sd	s9,200(sp)
    80001180:	0da13823          	sd	s10,208(sp)
    80001184:	0db13c23          	sd	s11,216(sp)
    80001188:	0fc13023          	sd	t3,224(sp)
    8000118c:	0fd13423          	sd	t4,232(sp)
    80001190:	0fe13823          	sd	t5,240(sp)
    80001194:	0ff13c23          	sd	t6,248(sp)
    ret
    80001198:	00008067          	ret

000000008000119c <_ZN12KernelThread12popRegistersEv>:
.global _ZN12KernelThread12popRegistersEv
.type _ZN12KernelThread12popRegistersEv, @function
_ZN12KernelThread12popRegistersEv:
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    8000119c:	01813183          	ld	gp,24(sp)
    800011a0:	02013203          	ld	tp,32(sp)
    800011a4:	02813283          	ld	t0,40(sp)
    800011a8:	03013303          	ld	t1,48(sp)
    800011ac:	03813383          	ld	t2,56(sp)
    800011b0:	04013403          	ld	s0,64(sp)
    800011b4:	04813483          	ld	s1,72(sp)
    800011b8:	05013503          	ld	a0,80(sp)
    800011bc:	05813583          	ld	a1,88(sp)
    800011c0:	06013603          	ld	a2,96(sp)
    800011c4:	06813683          	ld	a3,104(sp)
    800011c8:	07013703          	ld	a4,112(sp)
    800011cc:	07813783          	ld	a5,120(sp)
    800011d0:	08013803          	ld	a6,128(sp)
    800011d4:	08813883          	ld	a7,136(sp)
    800011d8:	09013903          	ld	s2,144(sp)
    800011dc:	09813983          	ld	s3,152(sp)
    800011e0:	0a013a03          	ld	s4,160(sp)
    800011e4:	0a813a83          	ld	s5,168(sp)
    800011e8:	0b013b03          	ld	s6,176(sp)
    800011ec:	0b813b83          	ld	s7,184(sp)
    800011f0:	0c013c03          	ld	s8,192(sp)
    800011f4:	0c813c83          	ld	s9,200(sp)
    800011f8:	0d013d03          	ld	s10,208(sp)
    800011fc:	0d813d83          	ld	s11,216(sp)
    80001200:	0e013e03          	ld	t3,224(sp)
    80001204:	0e813e83          	ld	t4,232(sp)
    80001208:	0f013f03          	ld	t5,240(sp)
    8000120c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001210:	10010113          	addi	sp,sp,256
    ret
    80001214:	00008067          	ret

0000000080001218 <_ZN12KernelThread13contextSwitchEPNS_7ContextES1_>:
.global _ZN12KernelThread13contextSwitchEPNS_7ContextES1_
.type _ZN12KernelThread13contextSwitchEPNS_7ContextES1_, @function
_ZN12KernelThread13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001218:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    8000121c:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001220:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    80001224:	0085b103          	ld	sp,8(a1)

    80001228:	00008067          	ret

000000008000122c <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    8000122c:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001230:	00b29a63          	bne	t0,a1,80001244 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001234:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001238:	fe029ae3          	bnez	t0,8000122c <copy_and_swap>
    li a0, 0               # Set return to success.
    8000123c:	00000513          	li	a0,0
    jr ra                  # Return.
    80001240:	00008067          	ret

0000000080001244 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001244:	00100513          	li	a0,1
    80001248:	00008067          	ret

000000008000124c <_Z9mem_allocm>:
#include "../h/syscall_c.hpp"
#include "../test/printing.hpp"

void *mem_alloc(size_t size) {
    8000124c:	ff010113          	addi	sp,sp,-16
    80001250:	00113423          	sd	ra,8(sp)
    80001254:	00813023          	sd	s0,0(sp)
    80001258:	01010413          	addi	s0,sp,16
    size_t sz = MemoryAllocator::roundToNumOfBlocks(size);
    8000125c:	00001097          	auipc	ra,0x1
    80001260:	6c4080e7          	jalr	1732(ra) # 80002920 <_ZN15MemoryAllocator18roundToNumOfBlocksEm>


    __asm__ volatile ("mv a1, %0"::"r"(sz));
    80001264:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x01");
    80001268:	00100513          	li	a0,1

    __asm__ volatile ("ecall");
    8000126c:	00000073          	ecall

    void *ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    80001270:	00050513          	mv	a0,a0

    return ret;
}
    80001274:	00813083          	ld	ra,8(sp)
    80001278:	00013403          	ld	s0,0(sp)
    8000127c:	01010113          	addi	sp,sp,16
    80001280:	00008067          	ret

0000000080001284 <_Z8mem_freePv>:

int mem_free(void * addr) {
    80001284:	ff010113          	addi	sp,sp,-16
    80001288:	00813423          	sd	s0,8(sp)
    8000128c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0"::"r"(addr));
    80001290:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x02");
    80001294:	00200513          	li	a0,2

    __asm__ volatile ("ecall");
    80001298:	00000073          	ecall

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    8000129c:	00050513          	mv	a0,a0

    return ret;
}
    800012a0:	0005051b          	sext.w	a0,a0
    800012a4:	00813403          	ld	s0,8(sp)
    800012a8:	01010113          	addi	sp,sp,16
    800012ac:	00008067          	ret

00000000800012b0 <_Z13thread_createPP12KernelThreadPFvPvES2_>:

int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    void *r = nullptr;
    if(handle==nullptr)return -1;
    800012b0:	08050663          	beqz	a0,8000133c <_Z13thread_createPP12KernelThreadPFvPvES2_+0x8c>
int thread_create(thread_t *handle, void (*start_routine)(void *), void *arg) {
    800012b4:	fd010113          	addi	sp,sp,-48
    800012b8:	02113423          	sd	ra,40(sp)
    800012bc:	02813023          	sd	s0,32(sp)
    800012c0:	00913c23          	sd	s1,24(sp)
    800012c4:	01213823          	sd	s2,16(sp)
    800012c8:	01313423          	sd	s3,8(sp)
    800012cc:	03010413          	addi	s0,sp,48
    800012d0:	00050493          	mv	s1,a0
    800012d4:	00058913          	mv	s2,a1
    800012d8:	00060993          	mv	s3,a2
    if (start_routine != nullptr) {
    800012dc:	04058c63          	beqz	a1,80001334 <_Z13thread_createPP12KernelThreadPFvPvES2_+0x84>
        r = mem_alloc(DEFAULT_STACK_SIZE);
    800012e0:	00001537          	lui	a0,0x1
    800012e4:	00000097          	auipc	ra,0x0
    800012e8:	f68080e7          	jalr	-152(ra) # 8000124c <_Z9mem_allocm>
        if(!r)return -1;
    800012ec:	04050c63          	beqz	a0,80001344 <_Z13thread_createPP12KernelThreadPFvPvES2_+0x94>
    }

    __asm__ volatile("mv a5, %0"::"r"(1));
    800012f0:	00100793          	li	a5,1
    800012f4:	00078793          	mv	a5,a5
    __asm__ volatile ("mv a4, %0"::"r"(r));
    800012f8:	00050713          	mv	a4,a0
    __asm__ volatile ("mv a3, %0"::"r"(arg));
    800012fc:	00098693          	mv	a3,s3
    __asm__ volatile ("mv a2, %0"::"r"(start_routine));
    80001300:	00090613          	mv	a2,s2
    __asm__ volatile ("mv a1, %0"::"r"(handle));
    80001304:	00048593          	mv	a1,s1
    __asm__ volatile ("li a0, 0x11");
    80001308:	01100513          	li	a0,17

    __asm__ volatile ("ecall");
    8000130c:	00000073          	ecall

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    80001310:	00050513          	mv	a0,a0
    80001314:	0005051b          	sext.w	a0,a0

    return ret;
}
    80001318:	02813083          	ld	ra,40(sp)
    8000131c:	02013403          	ld	s0,32(sp)
    80001320:	01813483          	ld	s1,24(sp)
    80001324:	01013903          	ld	s2,16(sp)
    80001328:	00813983          	ld	s3,8(sp)
    8000132c:	03010113          	addi	sp,sp,48
    80001330:	00008067          	ret
    void *r = nullptr;
    80001334:	00000513          	li	a0,0
    80001338:	fb9ff06f          	j	800012f0 <_Z13thread_createPP12KernelThreadPFvPvES2_+0x40>
    if(handle==nullptr)return -1;
    8000133c:	fff00513          	li	a0,-1
}
    80001340:	00008067          	ret
        if(!r)return -1;
    80001344:	fff00513          	li	a0,-1
    80001348:	fd1ff06f          	j	80001318 <_Z13thread_createPP12KernelThreadPFvPvES2_+0x68>

000000008000134c <_Z11thread_exitv>:

int thread_exit() {
    8000134c:	ff010113          	addi	sp,sp,-16
    80001350:	00813423          	sd	s0,8(sp)
    80001354:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x12");
    80001358:	01200513          	li	a0,18

    __asm__ volatile ("ecall");
    8000135c:	00000073          	ecall

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    80001360:	00050513          	mv	a0,a0

    return ret;
}
    80001364:	0005051b          	sext.w	a0,a0
    80001368:	00813403          	ld	s0,8(sp)
    8000136c:	01010113          	addi	sp,sp,16
    80001370:	00008067          	ret

0000000080001374 <_Z15thread_dispatchv>:

void thread_dispatch() {
    80001374:	ff010113          	addi	sp,sp,-16
    80001378:	00813423          	sd	s0,8(sp)
    8000137c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x13");
    80001380:	01300513          	li	a0,19
    //printString("Ovde1\n");
    __asm__ volatile ("ecall");
    80001384:	00000073          	ecall
    //printString("Ovde2\n");
}
    80001388:	00813403          	ld	s0,8(sp)
    8000138c:	01010113          	addi	sp,sp,16
    80001390:	00008067          	ret

0000000080001394 <_Z8sem_openPP15KernelSemaphorej>:

int sem_open(sem_t *handle, unsigned init) {
    80001394:	ff010113          	addi	sp,sp,-16
    80001398:	00813423          	sd	s0,8(sp)
    8000139c:	01010413          	addi	s0,sp,16

    __asm__ volatile ("mv a2, %0"::"r"(init));
    800013a0:	00058613          	mv	a2,a1
    __asm__ volatile ("mv a1, %0"::"r"(handle));
    800013a4:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x21");
    800013a8:	02100513          	li	a0,33

    __asm__ volatile ("ecall");
    800013ac:	00000073          	ecall

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    800013b0:	00050513          	mv	a0,a0

    return ret;
}
    800013b4:	0005051b          	sext.w	a0,a0
    800013b8:	00813403          	ld	s0,8(sp)
    800013bc:	01010113          	addi	sp,sp,16
    800013c0:	00008067          	ret

00000000800013c4 <_Z9sem_closeP15KernelSemaphore>:

int sem_close(sem_t handle) {
    800013c4:	ff010113          	addi	sp,sp,-16
    800013c8:	00813423          	sd	s0,8(sp)
    800013cc:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0"::"r"(handle));
    800013d0:	00050593          	mv	a1,a0

    __asm__ volatile ("li a0, 0x22");
    800013d4:	02200513          	li	a0,34

    __asm__ volatile ("ecall");
    800013d8:	00000073          	ecall

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    800013dc:	00050513          	mv	a0,a0

    return ret;
}
    800013e0:	0005051b          	sext.w	a0,a0
    800013e4:	00813403          	ld	s0,8(sp)
    800013e8:	01010113          	addi	sp,sp,16
    800013ec:	00008067          	ret

00000000800013f0 <_Z8sem_waitP15KernelSemaphore>:

int sem_wait(sem_t id) {
    800013f0:	ff010113          	addi	sp,sp,-16
    800013f4:	00813423          	sd	s0,8(sp)
    800013f8:	01010413          	addi	s0,sp,16

    __asm__ volatile ("mv a1, %0"::"r"(id));
    800013fc:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x23");
    80001400:	02300513          	li	a0,35

    __asm__ volatile ("ecall");
    80001404:	00000073          	ecall

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    80001408:	00050513          	mv	a0,a0

    return ret;
}
    8000140c:	0005051b          	sext.w	a0,a0
    80001410:	00813403          	ld	s0,8(sp)
    80001414:	01010113          	addi	sp,sp,16
    80001418:	00008067          	ret

000000008000141c <_Z10sem_signalP15KernelSemaphore>:

int sem_signal(sem_t id) {
    8000141c:	ff010113          	addi	sp,sp,-16
    80001420:	00813423          	sd	s0,8(sp)
    80001424:	01010413          	addi	s0,sp,16

    __asm__ volatile ("mv a1, %0"::"r"(id));
    80001428:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x24");
    8000142c:	02400513          	li	a0,36

    __asm__ volatile ("ecall");
    80001430:	00000073          	ecall

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    80001434:	00050513          	mv	a0,a0

    return ret;
}
    80001438:	0005051b          	sext.w	a0,a0
    8000143c:	00813403          	ld	s0,8(sp)
    80001440:	01010113          	addi	sp,sp,16
    80001444:	00008067          	ret

0000000080001448 <_Z10time_sleepm>:

int time_sleep(time_t time) {
    80001448:	ff010113          	addi	sp,sp,-16
    8000144c:	00813423          	sd	s0,8(sp)
    80001450:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0"::"r"(time));
    80001454:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x31");
    80001458:	03100513          	li	a0,49

    __asm__ volatile ("ecall");
    8000145c:	00000073          	ecall

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    80001460:	00050513          	mv	a0,a0

    return ret;
}
    80001464:	0005051b          	sext.w	a0,a0
    80001468:	00813403          	ld	s0,8(sp)
    8000146c:	01010113          	addi	sp,sp,16
    80001470:	00008067          	ret

0000000080001474 <_Z4getcv>:
char getc() {
    80001474:	ff010113          	addi	sp,sp,-16
    80001478:	00813423          	sd	s0,8(sp)
    8000147c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x41");
    80001480:	04100513          	li	a0,65

    __asm__ volatile ("ecall");
    80001484:	00000073          	ecall

    char ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    80001488:	00050513          	mv	a0,a0

    return ret;
}
    8000148c:	0ff57513          	andi	a0,a0,255
    80001490:	00813403          	ld	s0,8(sp)
    80001494:	01010113          	addi	sp,sp,16
    80001498:	00008067          	ret

000000008000149c <_Z4putcc>:

void putc(char c) {
    8000149c:	ff010113          	addi	sp,sp,-16
    800014a0:	00813423          	sd	s0,8(sp)
    800014a4:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0"::"r"(c));
    800014a8:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x42");
    800014ac:	04200513          	li	a0,66

    __asm__ volatile ("ecall");
    800014b0:	00000073          	ecall

}
    800014b4:	00813403          	ld	s0,8(sp)
    800014b8:	01010113          	addi	sp,sp,16
    800014bc:	00008067          	ret

00000000800014c0 <_Z16changeToUserModev>:

void changeToUserMode() {
    800014c0:	ff010113          	addi	sp,sp,-16
    800014c4:	00813423          	sd	s0,8(sp)
    800014c8:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x51");
    800014cc:	05100513          	li	a0,81

    __asm__ volatile ("ecall");
    800014d0:	00000073          	ecall
}
    800014d4:	00813403          	ld	s0,8(sp)
    800014d8:	01010113          	addi	sp,sp,16
    800014dc:	00008067          	ret

00000000800014e0 <_Z22changeToPrivilegedModev>:

void changeToPrivilegedMode() {
    800014e0:	ff010113          	addi	sp,sp,-16
    800014e4:	00813423          	sd	s0,8(sp)
    800014e8:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x52");
    800014ec:	05200513          	li	a0,82

    __asm__ volatile ("ecall");
    800014f0:	00000073          	ecall
}
    800014f4:	00813403          	ld	s0,8(sp)
    800014f8:	01010113          	addi	sp,sp,16
    800014fc:	00008067          	ret

0000000080001500 <_Z12thread_startP12KernelThread>:

int thread_start(thread_t handle){
    80001500:	ff010113          	addi	sp,sp,-16
    80001504:	00813423          	sd	s0,8(sp)
    80001508:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0"::"r"(handle));
    8000150c:	00050593          	mv	a1,a0
    __asm__ volatile ("li a0, 0x14");
    80001510:	01400513          	li	a0,20

    __asm__ volatile ("ecall");
    80001514:	00000073          	ecall

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    80001518:	00050513          	mv	a0,a0

    return ret;
}
    8000151c:	0005051b          	sext.w	a0,a0
    80001520:	00813403          	ld	s0,8(sp)
    80001524:	01010113          	addi	sp,sp,16
    80001528:	00008067          	ret

000000008000152c <_Z16thread_create_v2PP12KernelThreadPFvPvES2_>:

int thread_create_v2(thread_t *handle, void (*start_routine)(void *), void *arg) {
    void *r = nullptr;
    if(handle==nullptr)return -1;
    8000152c:	08050663          	beqz	a0,800015b8 <_Z16thread_create_v2PP12KernelThreadPFvPvES2_+0x8c>
int thread_create_v2(thread_t *handle, void (*start_routine)(void *), void *arg) {
    80001530:	fd010113          	addi	sp,sp,-48
    80001534:	02113423          	sd	ra,40(sp)
    80001538:	02813023          	sd	s0,32(sp)
    8000153c:	00913c23          	sd	s1,24(sp)
    80001540:	01213823          	sd	s2,16(sp)
    80001544:	01313423          	sd	s3,8(sp)
    80001548:	03010413          	addi	s0,sp,48
    8000154c:	00050493          	mv	s1,a0
    80001550:	00058913          	mv	s2,a1
    80001554:	00060993          	mv	s3,a2
    if (start_routine != nullptr) {
    80001558:	04058c63          	beqz	a1,800015b0 <_Z16thread_create_v2PP12KernelThreadPFvPvES2_+0x84>
        r = mem_alloc(DEFAULT_STACK_SIZE);
    8000155c:	00001537          	lui	a0,0x1
    80001560:	00000097          	auipc	ra,0x0
    80001564:	cec080e7          	jalr	-788(ra) # 8000124c <_Z9mem_allocm>
        if(!r)return -1;
    80001568:	04050c63          	beqz	a0,800015c0 <_Z16thread_create_v2PP12KernelThreadPFvPvES2_+0x94>
    }

    __asm__ volatile("mv a5, %0"::"r"(0));
    8000156c:	00000793          	li	a5,0
    80001570:	00078793          	mv	a5,a5
    __asm__ volatile ("mv a4, %0"::"r"(r));
    80001574:	00050713          	mv	a4,a0
    __asm__ volatile ("mv a3, %0"::"r"(arg));
    80001578:	00098693          	mv	a3,s3
    __asm__ volatile ("mv a2, %0"::"r"(start_routine));
    8000157c:	00090613          	mv	a2,s2
    __asm__ volatile ("mv a1, %0"::"r"(handle));
    80001580:	00048593          	mv	a1,s1
    __asm__ volatile ("li a0, 0x11");
    80001584:	01100513          	li	a0,17

    __asm__ volatile ("ecall");
    80001588:	00000073          	ecall

    int ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    8000158c:	00050513          	mv	a0,a0
    80001590:	0005051b          	sext.w	a0,a0

    return ret;
};
    80001594:	02813083          	ld	ra,40(sp)
    80001598:	02013403          	ld	s0,32(sp)
    8000159c:	01813483          	ld	s1,24(sp)
    800015a0:	01013903          	ld	s2,16(sp)
    800015a4:	00813983          	ld	s3,8(sp)
    800015a8:	03010113          	addi	sp,sp,48
    800015ac:	00008067          	ret
    void *r = nullptr;
    800015b0:	00000513          	li	a0,0
    800015b4:	fb9ff06f          	j	8000156c <_Z16thread_create_v2PP12KernelThreadPFvPvES2_+0x40>
    if(handle==nullptr)return -1;
    800015b8:	fff00513          	li	a0,-1
};
    800015bc:	00008067          	ret
        if(!r)return -1;
    800015c0:	fff00513          	li	a0,-1
    800015c4:	fd1ff06f          	j	80001594 <_Z16thread_create_v2PP12KernelThreadPFvPvES2_+0x68>

00000000800015c8 <_ZN12KernelBuffer3putEc>:


KernelBuffer* KernelBuffer::ulaz = nullptr;
KernelBuffer* KernelBuffer::izlaz = nullptr;

void KernelBuffer::put(char c) {
    800015c8:	fe010113          	addi	sp,sp,-32
    800015cc:	00113c23          	sd	ra,24(sp)
    800015d0:	00813823          	sd	s0,16(sp)
    800015d4:	00913423          	sd	s1,8(sp)
    800015d8:	01213023          	sd	s2,0(sp)
    800015dc:	02010413          	addi	s0,sp,32
    800015e0:	00050493          	mv	s1,a0
    800015e4:	00058913          	mv	s2,a1

    spaceAvailable->wait();
    800015e8:	01853503          	ld	a0,24(a0) # 1018 <_entry-0x7fffefe8>
    800015ec:	00001097          	auipc	ra,0x1
    800015f0:	cd8080e7          	jalr	-808(ra) # 800022c4 <_ZN15KernelSemaphore4waitEv>

    buffer[tail++] = c;
    800015f4:	0084b783          	ld	a5,8(s1)
    800015f8:	0144a703          	lw	a4,20(s1)
    800015fc:	0017069b          	addiw	a3,a4,1
    80001600:	00d4aa23          	sw	a3,20(s1)
    80001604:	00e787b3          	add	a5,a5,a4
    80001608:	01278023          	sb	s2,0(a5)
    tail %=  cap;
    8000160c:	0004a703          	lw	a4,0(s1)
    80001610:	0144a783          	lw	a5,20(s1)
    80001614:	02e7e7bb          	remw	a5,a5,a4
    80001618:	00f4aa23          	sw	a5,20(s1)

    itemAvailable->signal();
    8000161c:	0204b503          	ld	a0,32(s1)
    80001620:	00001097          	auipc	ra,0x1
    80001624:	b8c080e7          	jalr	-1140(ra) # 800021ac <_ZN15KernelSemaphore6signalEv>
}
    80001628:	01813083          	ld	ra,24(sp)
    8000162c:	01013403          	ld	s0,16(sp)
    80001630:	00813483          	ld	s1,8(sp)
    80001634:	00013903          	ld	s2,0(sp)
    80001638:	02010113          	addi	sp,sp,32
    8000163c:	00008067          	ret

0000000080001640 <_ZN12KernelBuffer3getEv>:

char KernelBuffer::get() {
    80001640:	fe010113          	addi	sp,sp,-32
    80001644:	00113c23          	sd	ra,24(sp)
    80001648:	00813823          	sd	s0,16(sp)
    8000164c:	00913423          	sd	s1,8(sp)
    80001650:	01213023          	sd	s2,0(sp)
    80001654:	02010413          	addi	s0,sp,32
    80001658:	00050493          	mv	s1,a0
    if(itemAvailable->wait()<0)return -1;
    8000165c:	02053503          	ld	a0,32(a0)
    80001660:	00001097          	auipc	ra,0x1
    80001664:	c64080e7          	jalr	-924(ra) # 800022c4 <_ZN15KernelSemaphore4waitEv>
    80001668:	04054863          	bltz	a0,800016b8 <_ZN12KernelBuffer3getEv+0x78>

    char c = buffer[head++];
    8000166c:	0084b703          	ld	a4,8(s1)
    80001670:	0104a683          	lw	a3,16(s1)
    80001674:	0016879b          	addiw	a5,a3,1
    80001678:	00f4a823          	sw	a5,16(s1)
    8000167c:	00d70733          	add	a4,a4,a3
    80001680:	00074903          	lbu	s2,0(a4)
    head %= cap;
    80001684:	0004a703          	lw	a4,0(s1)
    80001688:	02e7e7bb          	remw	a5,a5,a4
    8000168c:	00f4a823          	sw	a5,16(s1)

    spaceAvailable->signal();
    80001690:	0184b503          	ld	a0,24(s1)
    80001694:	00001097          	auipc	ra,0x1
    80001698:	b18080e7          	jalr	-1256(ra) # 800021ac <_ZN15KernelSemaphore6signalEv>
    return c;
}
    8000169c:	00090513          	mv	a0,s2
    800016a0:	01813083          	ld	ra,24(sp)
    800016a4:	01013403          	ld	s0,16(sp)
    800016a8:	00813483          	ld	s1,8(sp)
    800016ac:	00013903          	ld	s2,0(sp)
    800016b0:	02010113          	addi	sp,sp,32
    800016b4:	00008067          	ret
    if(itemAvailable->wait()<0)return -1;
    800016b8:	0ff00913          	li	s2,255
    800016bc:	fe1ff06f          	j	8000169c <_ZN12KernelBuffer3getEv+0x5c>

00000000800016c0 <_ZN12KernelBuffer10createBuffEv>:

void KernelBuffer::createBuff() {
    800016c0:	fd010113          	addi	sp,sp,-48
    800016c4:	02113423          	sd	ra,40(sp)
    800016c8:	02813023          	sd	s0,32(sp)
    800016cc:	00913c23          	sd	s1,24(sp)
    800016d0:	01213823          	sd	s2,16(sp)
    800016d4:	01313423          	sd	s3,8(sp)
    800016d8:	03010413          	addi	s0,sp,48
    size_t size = sizeof(KernelBuffer);
    size_t sz = MemoryAllocator::roundToNumOfBlocks(size);
    800016dc:	02800513          	li	a0,40
    800016e0:	00001097          	auipc	ra,0x1
    800016e4:	240080e7          	jalr	576(ra) # 80002920 <_ZN15MemoryAllocator18roundToNumOfBlocksEm>
    800016e8:	00050913          	mv	s2,a0
    ulaz = (KernelBuffer*)MemoryAllocator::malloc(sz);
    800016ec:	00001097          	auipc	ra,0x1
    800016f0:	2b0080e7          	jalr	688(ra) # 8000299c <_ZN15MemoryAllocator6mallocEm>
    800016f4:	00006497          	auipc	s1,0x6
    800016f8:	09c48493          	addi	s1,s1,156 # 80007790 <_ZN12KernelBuffer4ulazE>
    800016fc:	00a4b023          	sd	a0,0(s1)
    izlaz = (KernelBuffer*)MemoryAllocator::malloc(sz);
    80001700:	00090513          	mv	a0,s2
    80001704:	00001097          	auipc	ra,0x1
    80001708:	298080e7          	jalr	664(ra) # 8000299c <_ZN15MemoryAllocator6mallocEm>
    8000170c:	00a4b423          	sd	a0,8(s1)

    size = sizeof(char)*DEFAULT_BUFFER_SIZE;
    sz = MemoryAllocator::roundToNumOfBlocks(size);
    80001710:	40000513          	li	a0,1024
    80001714:	00001097          	auipc	ra,0x1
    80001718:	20c080e7          	jalr	524(ra) # 80002920 <_ZN15MemoryAllocator18roundToNumOfBlocksEm>
    8000171c:	00050913          	mv	s2,a0
    ulaz->buffer = (char*)MemoryAllocator::malloc(sz);
    80001720:	0004b983          	ld	s3,0(s1)
    80001724:	00001097          	auipc	ra,0x1
    80001728:	278080e7          	jalr	632(ra) # 8000299c <_ZN15MemoryAllocator6mallocEm>
    8000172c:	00a9b423          	sd	a0,8(s3)
    izlaz->buffer = (char*)MemoryAllocator::malloc(sz);
    80001730:	0084b983          	ld	s3,8(s1)
    80001734:	00090513          	mv	a0,s2
    80001738:	00001097          	auipc	ra,0x1
    8000173c:	264080e7          	jalr	612(ra) # 8000299c <_ZN15MemoryAllocator6mallocEm>
    80001740:	00a9b423          	sd	a0,8(s3)

    ulaz->cap = DEFAULT_BUFFER_SIZE;
    80001744:	0004b703          	ld	a4,0(s1)
    80001748:	40000793          	li	a5,1024
    8000174c:	00f72023          	sw	a5,0(a4)
    izlaz->cap = DEFAULT_BUFFER_SIZE;
    80001750:	0084b703          	ld	a4,8(s1)
    80001754:	00f72023          	sw	a5,0(a4)

    ulaz->head = 0;
    80001758:	0004b503          	ld	a0,0(s1)
    8000175c:	00052823          	sw	zero,16(a0)
    ulaz->tail = 0;
    80001760:	00052a23          	sw	zero,20(a0)
    izlaz->head = 0;
    80001764:	0084b783          	ld	a5,8(s1)
    80001768:	0007a823          	sw	zero,16(a5)
    izlaz->tail = 0;
    8000176c:	0007aa23          	sw	zero,20(a5)


    KernelSemaphore::createSemaphore(&ulaz->itemAvailable, 0);
    80001770:	00000593          	li	a1,0
    80001774:	02050513          	addi	a0,a0,32
    80001778:	00001097          	auipc	ra,0x1
    8000177c:	934080e7          	jalr	-1740(ra) # 800020ac <_ZN15KernelSemaphore15createSemaphoreEPPS_i>
    KernelSemaphore::createSemaphore(&ulaz->spaceAvailable, DEFAULT_BUFFER_SIZE);
    80001780:	0004b503          	ld	a0,0(s1)
    80001784:	40000593          	li	a1,1024
    80001788:	01850513          	addi	a0,a0,24
    8000178c:	00001097          	auipc	ra,0x1
    80001790:	920080e7          	jalr	-1760(ra) # 800020ac <_ZN15KernelSemaphore15createSemaphoreEPPS_i>


    KernelSemaphore::createSemaphore(&izlaz->itemAvailable, 0);
    80001794:	0084b503          	ld	a0,8(s1)
    80001798:	00000593          	li	a1,0
    8000179c:	02050513          	addi	a0,a0,32
    800017a0:	00001097          	auipc	ra,0x1
    800017a4:	90c080e7          	jalr	-1780(ra) # 800020ac <_ZN15KernelSemaphore15createSemaphoreEPPS_i>
    KernelSemaphore::createSemaphore(&izlaz->spaceAvailable, DEFAULT_BUFFER_SIZE);
    800017a8:	0084b503          	ld	a0,8(s1)
    800017ac:	40000593          	li	a1,1024
    800017b0:	01850513          	addi	a0,a0,24
    800017b4:	00001097          	auipc	ra,0x1
    800017b8:	8f8080e7          	jalr	-1800(ra) # 800020ac <_ZN15KernelSemaphore15createSemaphoreEPPS_i>
}
    800017bc:	02813083          	ld	ra,40(sp)
    800017c0:	02013403          	ld	s0,32(sp)
    800017c4:	01813483          	ld	s1,24(sp)
    800017c8:	01013903          	ld	s2,16(sp)
    800017cc:	00813983          	ld	s3,8(sp)
    800017d0:	03010113          	addi	sp,sp,48
    800017d4:	00008067          	ret

00000000800017d8 <_ZN12KernelBuffer12destroyBuffsEv>:

void KernelBuffer::destroyBuffs() {
    800017d8:	fe010113          	addi	sp,sp,-32
    800017dc:	00113c23          	sd	ra,24(sp)
    800017e0:	00813823          	sd	s0,16(sp)
    800017e4:	00913423          	sd	s1,8(sp)
    800017e8:	02010413          	addi	s0,sp,32
    MemoryAllocator::free((void*)ulaz->buffer);
    800017ec:	00006497          	auipc	s1,0x6
    800017f0:	fa448493          	addi	s1,s1,-92 # 80007790 <_ZN12KernelBuffer4ulazE>
    800017f4:	0004b783          	ld	a5,0(s1)
    800017f8:	0087b503          	ld	a0,8(a5)
    800017fc:	00001097          	auipc	ra,0x1
    80001800:	2ac080e7          	jalr	684(ra) # 80002aa8 <_ZN15MemoryAllocator4freeEPv>
    KernelSemaphore::destroy(ulaz->itemAvailable);
    80001804:	0004b783          	ld	a5,0(s1)
    80001808:	0207b503          	ld	a0,32(a5)
    8000180c:	00000097          	auipc	ra,0x0
    80001810:	7f8080e7          	jalr	2040(ra) # 80002004 <_ZN15KernelSemaphore7destroyEPS_>
    KernelSemaphore::destroy(ulaz->spaceAvailable);
    80001814:	0004b783          	ld	a5,0(s1)
    80001818:	0187b503          	ld	a0,24(a5)
    8000181c:	00000097          	auipc	ra,0x0
    80001820:	7e8080e7          	jalr	2024(ra) # 80002004 <_ZN15KernelSemaphore7destroyEPS_>

    MemoryAllocator::free((void*)izlaz->buffer);
    80001824:	0084b783          	ld	a5,8(s1)
    80001828:	0087b503          	ld	a0,8(a5)
    8000182c:	00001097          	auipc	ra,0x1
    80001830:	27c080e7          	jalr	636(ra) # 80002aa8 <_ZN15MemoryAllocator4freeEPv>
    KernelSemaphore::destroy(izlaz->itemAvailable);
    80001834:	0084b783          	ld	a5,8(s1)
    80001838:	0207b503          	ld	a0,32(a5)
    8000183c:	00000097          	auipc	ra,0x0
    80001840:	7c8080e7          	jalr	1992(ra) # 80002004 <_ZN15KernelSemaphore7destroyEPS_>
    KernelSemaphore::destroy(izlaz->spaceAvailable);
    80001844:	0084b783          	ld	a5,8(s1)
    80001848:	0187b503          	ld	a0,24(a5)
    8000184c:	00000097          	auipc	ra,0x0
    80001850:	7b8080e7          	jalr	1976(ra) # 80002004 <_ZN15KernelSemaphore7destroyEPS_>


    MemoryAllocator::free((void*)ulaz);
    80001854:	0004b503          	ld	a0,0(s1)
    80001858:	00001097          	auipc	ra,0x1
    8000185c:	250080e7          	jalr	592(ra) # 80002aa8 <_ZN15MemoryAllocator4freeEPv>
    MemoryAllocator::free((void*)izlaz);
    80001860:	0084b503          	ld	a0,8(s1)
    80001864:	00001097          	auipc	ra,0x1
    80001868:	244080e7          	jalr	580(ra) # 80002aa8 <_ZN15MemoryAllocator4freeEPv>

}
    8000186c:	01813083          	ld	ra,24(sp)
    80001870:	01013403          	ld	s0,16(sp)
    80001874:	00813483          	ld	s1,8(sp)
    80001878:	02010113          	addi	sp,sp,32
    8000187c:	00008067          	ret

0000000080001880 <_ZN12KernelBuffer6getCntEv>:

int KernelBuffer::getCnt() {
    80001880:	ff010113          	addi	sp,sp,-16
    80001884:	00813423          	sd	s0,8(sp)
    80001888:	01010413          	addi	s0,sp,16

    int ret;
    if (tail >= head) {
    8000188c:	01452783          	lw	a5,20(a0)
    80001890:	01052703          	lw	a4,16(a0)
    80001894:	00e7ca63          	blt	a5,a4,800018a8 <_ZN12KernelBuffer6getCntEv+0x28>
        ret = tail - head;
    80001898:	40e7853b          	subw	a0,a5,a4
    } else {
        ret = cap - head + tail;
    }

    return ret;
    8000189c:	00813403          	ld	s0,8(sp)
    800018a0:	01010113          	addi	sp,sp,16
    800018a4:	00008067          	ret
        ret = cap - head + tail;
    800018a8:	00052503          	lw	a0,0(a0)
    800018ac:	40e5053b          	subw	a0,a0,a4
    800018b0:	00f5053b          	addw	a0,a0,a5
    800018b4:	fe9ff06f          	j	8000189c <_ZN12KernelBuffer6getCntEv+0x1c>

00000000800018b8 <_Z12idleFunctionv>:
#include "../h/Scheduler.hpp"
#include "../h/syscall_c.hpp"
#include "../test/printing.hpp"
#include "../h/KernelBuffer.hpp"

void idleFunction() {
    800018b8:	ff010113          	addi	sp,sp,-16
    800018bc:	00113423          	sd	ra,8(sp)
    800018c0:	00813023          	sd	s0,0(sp)
    800018c4:	01010413          	addi	s0,sp,16
    KernelThread::popSppSpie();
    800018c8:	00001097          	auipc	ra,0x1
    800018cc:	5e4080e7          	jalr	1508(ra) # 80002eac <_ZN12KernelThread10popSppSpieEv>
    800018d0:	00c0006f          	j	800018dc <_Z12idleFunctionv+0x24>
    while(true){
        if(!Scheduler::empty()){
            thread_dispatch();
    800018d4:	00000097          	auipc	ra,0x0
    800018d8:	aa0080e7          	jalr	-1376(ra) # 80001374 <_Z15thread_dispatchv>
        if(!Scheduler::empty()){
    800018dc:	00000097          	auipc	ra,0x0
    800018e0:	1a8080e7          	jalr	424(ra) # 80001a84 <_ZN9Scheduler5emptyEv>
    800018e4:	fe051ce3          	bnez	a0,800018dc <_Z12idleFunctionv+0x24>
    800018e8:	fedff06f          	j	800018d4 <_Z12idleFunctionv+0x1c>

00000000800018ec <_Z11putFunctionv>:
        }
    }
}

void putFunction() {
    800018ec:	fe010113          	addi	sp,sp,-32
    800018f0:	00113c23          	sd	ra,24(sp)
    800018f4:	00813823          	sd	s0,16(sp)
    800018f8:	00913423          	sd	s1,8(sp)
    800018fc:	01213023          	sd	s2,0(sp)
    80001900:	02010413          	addi	s0,sp,32
    changeToPrivilegedMode();
    80001904:	00000097          	auipc	ra,0x0
    80001908:	bdc080e7          	jalr	-1060(ra) # 800014e0 <_Z22changeToPrivilegedModev>
    __asm__ volatile ("csrc sstatus, 0x2");
    8000190c:	10017073          	csrci	sstatus,2
    80001910:	0140006f          	j	80001924 <_Z11putFunctionv+0x38>
        uint8 *st = (uint8 *) CONSOLE_STATUS;
        while(((*st) & CONSOLE_TX_STATUS_BIT) && KernelBuffer::izlaz->getCnt() >0) {
            tx = (uint8 *) CONSOLE_TX_DATA;
            (*tx) = KernelBuffer::izlaz->get();
        }
        __asm__ volatile ("csrs sstatus, 0x2");
    80001914:	10016073          	csrsi	sstatus,2
        thread_dispatch();
    80001918:	00000097          	auipc	ra,0x0
    8000191c:	a5c080e7          	jalr	-1444(ra) # 80001374 <_Z15thread_dispatchv>
        __asm__ volatile ("csrc sstatus, 0x2");
    80001920:	10017073          	csrci	sstatus,2
        uint8 *tx = (uint8 *) CONSOLE_TX_DATA;
    80001924:	00006797          	auipc	a5,0x6
    80001928:	dec7b783          	ld	a5,-532(a5) # 80007710 <_GLOBAL_OFFSET_TABLE_+0x40>
    8000192c:	0007b903          	ld	s2,0(a5)
        uint8 *st = (uint8 *) CONSOLE_STATUS;
    80001930:	00006797          	auipc	a5,0x6
    80001934:	db07b783          	ld	a5,-592(a5) # 800076e0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001938:	0007b483          	ld	s1,0(a5)
        while(((*st) & CONSOLE_TX_STATUS_BIT) && KernelBuffer::izlaz->getCnt() >0) {
    8000193c:	0004c783          	lbu	a5,0(s1)
    80001940:	0207f793          	andi	a5,a5,32
    80001944:	fc0788e3          	beqz	a5,80001914 <_Z11putFunctionv+0x28>
    80001948:	00006797          	auipc	a5,0x6
    8000194c:	de07b783          	ld	a5,-544(a5) # 80007728 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001950:	0007b503          	ld	a0,0(a5)
    80001954:	00000097          	auipc	ra,0x0
    80001958:	f2c080e7          	jalr	-212(ra) # 80001880 <_ZN12KernelBuffer6getCntEv>
    8000195c:	faa05ce3          	blez	a0,80001914 <_Z11putFunctionv+0x28>
            (*tx) = KernelBuffer::izlaz->get();
    80001960:	00006797          	auipc	a5,0x6
    80001964:	dc87b783          	ld	a5,-568(a5) # 80007728 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001968:	0007b503          	ld	a0,0(a5)
    8000196c:	00000097          	auipc	ra,0x0
    80001970:	cd4080e7          	jalr	-812(ra) # 80001640 <_ZN12KernelBuffer3getEv>
    80001974:	00a90023          	sb	a0,0(s2)
        while(((*st) & CONSOLE_TX_STATUS_BIT) && KernelBuffer::izlaz->getCnt() >0) {
    80001978:	fc5ff06f          	j	8000193c <_Z11putFunctionv+0x50>

000000008000197c <_ZN9Scheduler3putEP12KernelThread>:
#include "../test/printing.hpp"
Scheduler::node* Scheduler::head = nullptr;

Scheduler::node* Scheduler::tail = nullptr;

void Scheduler::put(KernelThread * k) {
    8000197c:	fe010113          	addi	sp,sp,-32
    80001980:	00113c23          	sd	ra,24(sp)
    80001984:	00813823          	sd	s0,16(sp)
    80001988:	00913423          	sd	s1,8(sp)
    8000198c:	02010413          	addi	s0,sp,32
    80001990:	00050493          	mv	s1,a0

    size_t size = sizeof(Scheduler::node);
    size_t sz = MemoryAllocator::roundToNumOfBlocks(size);
    80001994:	01000513          	li	a0,16
    80001998:	00001097          	auipc	ra,0x1
    8000199c:	f88080e7          	jalr	-120(ra) # 80002920 <_ZN15MemoryAllocator18roundToNumOfBlocksEm>

    if(!head){
    800019a0:	00006797          	auipc	a5,0x6
    800019a4:	e007b783          	ld	a5,-512(a5) # 800077a0 <_ZN9Scheduler4headE>
    800019a8:	04078263          	beqz	a5,800019ec <_ZN9Scheduler3putEP12KernelThread+0x70>
        head->info =k;
        tail = head;
    }
    else{
        Scheduler::node* tr;
        tr = (Scheduler::node*)MemoryAllocator::malloc(sz);
    800019ac:	00001097          	auipc	ra,0x1
    800019b0:	ff0080e7          	jalr	-16(ra) # 8000299c <_ZN15MemoryAllocator6mallocEm>
        tr->next = nullptr;
    800019b4:	00053023          	sd	zero,0(a0)
        tr->info = k;
    800019b8:	00953423          	sd	s1,8(a0)
        tail->next=tr;
    800019bc:	00006797          	auipc	a5,0x6
    800019c0:	de478793          	addi	a5,a5,-540 # 800077a0 <_ZN9Scheduler4headE>
    800019c4:	0087b703          	ld	a4,8(a5)
    800019c8:	00a73023          	sd	a0,0(a4)
        tail = tail->next;
    800019cc:	0087b703          	ld	a4,8(a5)
    800019d0:	00073703          	ld	a4,0(a4)
    800019d4:	00e7b423          	sd	a4,8(a5)
    }
}
    800019d8:	01813083          	ld	ra,24(sp)
    800019dc:	01013403          	ld	s0,16(sp)
    800019e0:	00813483          	ld	s1,8(sp)
    800019e4:	02010113          	addi	sp,sp,32
    800019e8:	00008067          	ret
        head =(Scheduler::node*)MemoryAllocator::malloc(sz);
    800019ec:	00001097          	auipc	ra,0x1
    800019f0:	fb0080e7          	jalr	-80(ra) # 8000299c <_ZN15MemoryAllocator6mallocEm>
    800019f4:	00006797          	auipc	a5,0x6
    800019f8:	dac78793          	addi	a5,a5,-596 # 800077a0 <_ZN9Scheduler4headE>
    800019fc:	00a7b023          	sd	a0,0(a5)
        head->next = nullptr;
    80001a00:	00053023          	sd	zero,0(a0)
        head->info =k;
    80001a04:	0007b703          	ld	a4,0(a5)
    80001a08:	00973423          	sd	s1,8(a4)
        tail = head;
    80001a0c:	00e7b423          	sd	a4,8(a5)
    80001a10:	fc9ff06f          	j	800019d8 <_ZN9Scheduler3putEP12KernelThread+0x5c>

0000000080001a14 <_ZN9Scheduler3getEv>:

KernelThread *Scheduler::get() {
    80001a14:	fe010113          	addi	sp,sp,-32
    80001a18:	00113c23          	sd	ra,24(sp)
    80001a1c:	00813823          	sd	s0,16(sp)
    80001a20:	00913423          	sd	s1,8(sp)
    80001a24:	02010413          	addi	s0,sp,32
    if (!head)return KernelThread::idleThread;
    80001a28:	00006517          	auipc	a0,0x6
    80001a2c:	d7853503          	ld	a0,-648(a0) # 800077a0 <_ZN9Scheduler4headE>
    80001a30:	02050c63          	beqz	a0,80001a68 <_ZN9Scheduler3getEv+0x54>
    Scheduler::node *tr = head;
    head = head->next;
    80001a34:	00053783          	ld	a5,0(a0)
    80001a38:	00006717          	auipc	a4,0x6
    80001a3c:	d6f73423          	sd	a5,-664(a4) # 800077a0 <_ZN9Scheduler4headE>
    if(!head)tail=nullptr;
    80001a40:	02078c63          	beqz	a5,80001a78 <_ZN9Scheduler3getEv+0x64>
    KernelThread*ret = tr->info;
    80001a44:	00853483          	ld	s1,8(a0)
    MemoryAllocator::free((void*)tr);
    80001a48:	00001097          	auipc	ra,0x1
    80001a4c:	060080e7          	jalr	96(ra) # 80002aa8 <_ZN15MemoryAllocator4freeEPv>
    return ret;
}
    80001a50:	00048513          	mv	a0,s1
    80001a54:	01813083          	ld	ra,24(sp)
    80001a58:	01013403          	ld	s0,16(sp)
    80001a5c:	00813483          	ld	s1,8(sp)
    80001a60:	02010113          	addi	sp,sp,32
    80001a64:	00008067          	ret
    if (!head)return KernelThread::idleThread;
    80001a68:	00006797          	auipc	a5,0x6
    80001a6c:	c807b783          	ld	a5,-896(a5) # 800076e8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001a70:	0007b483          	ld	s1,0(a5)
    80001a74:	fddff06f          	j	80001a50 <_ZN9Scheduler3getEv+0x3c>
    if(!head)tail=nullptr;
    80001a78:	00006797          	auipc	a5,0x6
    80001a7c:	d207b823          	sd	zero,-720(a5) # 800077a8 <_ZN9Scheduler4tailE>
    80001a80:	fc5ff06f          	j	80001a44 <_ZN9Scheduler3getEv+0x30>

0000000080001a84 <_ZN9Scheduler5emptyEv>:

bool Scheduler::empty() {
    80001a84:	ff010113          	addi	sp,sp,-16
    80001a88:	00813423          	sd	s0,8(sp)
    80001a8c:	01010413          	addi	s0,sp,16
    if(head==nullptr)return true;
    80001a90:	00006797          	auipc	a5,0x6
    80001a94:	d107b783          	ld	a5,-752(a5) # 800077a0 <_ZN9Scheduler4headE>
    80001a98:	00078a63          	beqz	a5,80001aac <_ZN9Scheduler5emptyEv+0x28>
    else return false;
    80001a9c:	00000513          	li	a0,0
}
    80001aa0:	00813403          	ld	s0,8(sp)
    80001aa4:	01010113          	addi	sp,sp,16
    80001aa8:	00008067          	ret
    if(head==nullptr)return true;
    80001aac:	00100513          	li	a0,1
    80001ab0:	ff1ff06f          	j	80001aa0 <_ZN9Scheduler5emptyEv+0x1c>

0000000080001ab4 <main>:
#include "../h/syscall_c.hpp"
#include "../test/userMain.hpp"
extern "C" void supervisorTrap();

void main(){
    80001ab4:	fe010113          	addi	sp,sp,-32
    80001ab8:	00113c23          	sd	ra,24(sp)
    80001abc:	00813823          	sd	s0,16(sp)
    80001ac0:	02010413          	addi	s0,sp,32
    MemoryAllocator::init();
    80001ac4:	00001097          	auipc	ra,0x1
    80001ac8:	e88080e7          	jalr	-376(ra) # 8000294c <_ZN15MemoryAllocator4initEv>
    __asm__ volatile ("csrw stvec, %0" : :"r"(&supervisorTrap));
    80001acc:	00006797          	auipc	a5,0x6
    80001ad0:	c2c7b783          	ld	a5,-980(a5) # 800076f8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001ad4:	10579073          	csrw	stvec,a5

    thread_t mainThread;
    thread_create(&mainThread, nullptr, nullptr);
    80001ad8:	00000613          	li	a2,0
    80001adc:	00000593          	li	a1,0
    80001ae0:	fe840513          	addi	a0,s0,-24
    80001ae4:	fffff097          	auipc	ra,0xfffff
    80001ae8:	7cc080e7          	jalr	1996(ra) # 800012b0 <_Z13thread_createPP12KernelThreadPFvPvES2_>
    KernelThread::running = mainThread;
    80001aec:	00006797          	auipc	a5,0x6
    80001af0:	c147b783          	ld	a5,-1004(a5) # 80007700 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001af4:	fe843703          	ld	a4,-24(s0)
    80001af8:	00e7b023          	sd	a4,0(a5)
    KernelThread::initIdle();
    80001afc:	00001097          	auipc	ra,0x1
    80001b00:	300080e7          	jalr	768(ra) # 80002dfc <_ZN12KernelThread8initIdleEv>
    KernelThread::initPut();
    80001b04:	00001097          	auipc	ra,0x1
    80001b08:	448080e7          	jalr	1096(ra) # 80002f4c <_ZN12KernelThread7initPutEv>
    KernelBuffer::createBuff();
    80001b0c:	00000097          	auipc	ra,0x0
    80001b10:	bb4080e7          	jalr	-1100(ra) # 800016c0 <_ZN12KernelBuffer10createBuffEv>


    changeToUserMode();
    80001b14:	00000097          	auipc	ra,0x0
    80001b18:	9ac080e7          	jalr	-1620(ra) # 800014c0 <_Z16changeToUserModev>

    userMain();
    80001b1c:	00002097          	auipc	ra,0x2
    80001b20:	ff4080e7          	jalr	-12(ra) # 80003b10 <_Z8userMainv>
    80001b24:	0240006f          	j	80001b48 <main+0x94>



    while(KernelBuffer::ulaz->getCnt()>0 || KernelBuffer::izlaz->getCnt()>0){
                while(KernelBuffer::ulaz->getCnt()>0)getc();
    80001b28:	00000097          	auipc	ra,0x0
    80001b2c:	94c080e7          	jalr	-1716(ra) # 80001474 <_Z4getcv>
    80001b30:	00006797          	auipc	a5,0x6
    80001b34:	c007b783          	ld	a5,-1024(a5) # 80007730 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001b38:	0007b503          	ld	a0,0(a5)
    80001b3c:	00000097          	auipc	ra,0x0
    80001b40:	d44080e7          	jalr	-700(ra) # 80001880 <_ZN12KernelBuffer6getCntEv>
    80001b44:	fea042e3          	bgtz	a0,80001b28 <main+0x74>
    while(KernelBuffer::ulaz->getCnt()>0 || KernelBuffer::izlaz->getCnt()>0){
    80001b48:	00006797          	auipc	a5,0x6
    80001b4c:	be87b783          	ld	a5,-1048(a5) # 80007730 <_GLOBAL_OFFSET_TABLE_+0x60>
    80001b50:	0007b503          	ld	a0,0(a5)
    80001b54:	00000097          	auipc	ra,0x0
    80001b58:	d2c080e7          	jalr	-724(ra) # 80001880 <_ZN12KernelBuffer6getCntEv>
    80001b5c:	fca04ae3          	bgtz	a0,80001b30 <main+0x7c>
    80001b60:	00006797          	auipc	a5,0x6
    80001b64:	bc87b783          	ld	a5,-1080(a5) # 80007728 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001b68:	0007b503          	ld	a0,0(a5)
    80001b6c:	00000097          	auipc	ra,0x0
    80001b70:	d14080e7          	jalr	-748(ra) # 80001880 <_ZN12KernelBuffer6getCntEv>
    80001b74:	faa04ee3          	bgtz	a0,80001b30 <main+0x7c>
    }
    80001b78:	01813083          	ld	ra,24(sp)
    80001b7c:	01013403          	ld	s0,16(sp)
    80001b80:	02010113          	addi	sp,sp,32
    80001b84:	00008067          	ret

0000000080001b88 <_ZN6ThreadD1Ev>:

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create_v2(&myHandle,body,arg);
}

Thread::~Thread(){
    80001b88:	ff010113          	addi	sp,sp,-16
    80001b8c:	00813423          	sd	s0,8(sp)
    80001b90:	01010413          	addi	s0,sp,16
   // delete myHandle;
}
    80001b94:	00813403          	ld	s0,8(sp)
    80001b98:	01010113          	addi	sp,sp,16
    80001b9c:	00008067          	ret

0000000080001ba0 <_ZN6Thread13threadWrapperEPv>:
}

Thread::Thread() : Thread(threadWrapper,(void*)this){
}

void Thread::threadWrapper(void *arg) {
    80001ba0:	ff010113          	addi	sp,sp,-16
    80001ba4:	00113423          	sd	ra,8(sp)
    80001ba8:	00813023          	sd	s0,0(sp)
    80001bac:	01010413          	addi	s0,sp,16
    Thread*t;
    t = (Thread*)arg;
    t->run();
    80001bb0:	00053783          	ld	a5,0(a0)
    80001bb4:	0107b783          	ld	a5,16(a5)
    80001bb8:	000780e7          	jalr	a5
}
    80001bbc:	00813083          	ld	ra,8(sp)
    80001bc0:	00013403          	ld	s0,0(sp)
    80001bc4:	01010113          	addi	sp,sp,16
    80001bc8:	00008067          	ret

0000000080001bcc <_ZN14PeriodicThread21periodicThreadWrapperEPv>:
}

PeriodicThread::PeriodicThread(time_t period) : Thread(periodicThreadWrapper, (void*)(new periodic(period,this))) {
}

void PeriodicThread::periodicThreadWrapper(void *arg) {
    80001bcc:	fe010113          	addi	sp,sp,-32
    80001bd0:	00113c23          	sd	ra,24(sp)
    80001bd4:	00813823          	sd	s0,16(sp)
    80001bd8:	00913423          	sd	s1,8(sp)
    80001bdc:	02010413          	addi	s0,sp,32
    80001be0:	00050493          	mv	s1,a0
    periodic* s;
    s = (periodic*)arg;
    while(true){
        s->thread->periodicActivation();
    80001be4:	0084b503          	ld	a0,8(s1)
    80001be8:	00053783          	ld	a5,0(a0)
    80001bec:	0187b783          	ld	a5,24(a5)
    80001bf0:	000780e7          	jalr	a5
        time_sleep(s->period);
    80001bf4:	0004b503          	ld	a0,0(s1)
    80001bf8:	00000097          	auipc	ra,0x0
    80001bfc:	850080e7          	jalr	-1968(ra) # 80001448 <_Z10time_sleepm>
    while(true){
    80001c00:	fe5ff06f          	j	80001be4 <_ZN14PeriodicThread21periodicThreadWrapperEPv+0x18>

0000000080001c04 <_ZN9SemaphoreD1Ev>:
Semaphore::~Semaphore() {
    80001c04:	ff010113          	addi	sp,sp,-16
    80001c08:	00113423          	sd	ra,8(sp)
    80001c0c:	00813023          	sd	s0,0(sp)
    80001c10:	01010413          	addi	s0,sp,16
    80001c14:	00006797          	auipc	a5,0x6
    80001c18:	a1478793          	addi	a5,a5,-1516 # 80007628 <_ZTV9Semaphore+0x10>
    80001c1c:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80001c20:	00853503          	ld	a0,8(a0)
    80001c24:	fffff097          	auipc	ra,0xfffff
    80001c28:	7a0080e7          	jalr	1952(ra) # 800013c4 <_Z9sem_closeP15KernelSemaphore>
}
    80001c2c:	00813083          	ld	ra,8(sp)
    80001c30:	00013403          	ld	s0,0(sp)
    80001c34:	01010113          	addi	sp,sp,16
    80001c38:	00008067          	ret

0000000080001c3c <_Znwm>:
{
    80001c3c:	ff010113          	addi	sp,sp,-16
    80001c40:	00113423          	sd	ra,8(sp)
    80001c44:	00813023          	sd	s0,0(sp)
    80001c48:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    80001c4c:	fffff097          	auipc	ra,0xfffff
    80001c50:	600080e7          	jalr	1536(ra) # 8000124c <_Z9mem_allocm>
}
    80001c54:	00813083          	ld	ra,8(sp)
    80001c58:	00013403          	ld	s0,0(sp)
    80001c5c:	01010113          	addi	sp,sp,16
    80001c60:	00008067          	ret

0000000080001c64 <_Znam>:
{
    80001c64:	ff010113          	addi	sp,sp,-16
    80001c68:	00113423          	sd	ra,8(sp)
    80001c6c:	00813023          	sd	s0,0(sp)
    80001c70:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    80001c74:	fffff097          	auipc	ra,0xfffff
    80001c78:	5d8080e7          	jalr	1496(ra) # 8000124c <_Z9mem_allocm>
}
    80001c7c:	00813083          	ld	ra,8(sp)
    80001c80:	00013403          	ld	s0,0(sp)
    80001c84:	01010113          	addi	sp,sp,16
    80001c88:	00008067          	ret

0000000080001c8c <_ZdlPv>:
{
    80001c8c:	ff010113          	addi	sp,sp,-16
    80001c90:	00113423          	sd	ra,8(sp)
    80001c94:	00813023          	sd	s0,0(sp)
    80001c98:	01010413          	addi	s0,sp,16
    mem_free(p);
    80001c9c:	fffff097          	auipc	ra,0xfffff
    80001ca0:	5e8080e7          	jalr	1512(ra) # 80001284 <_Z8mem_freePv>
}
    80001ca4:	00813083          	ld	ra,8(sp)
    80001ca8:	00013403          	ld	s0,0(sp)
    80001cac:	01010113          	addi	sp,sp,16
    80001cb0:	00008067          	ret

0000000080001cb4 <_ZN6ThreadD0Ev>:
Thread::~Thread(){
    80001cb4:	ff010113          	addi	sp,sp,-16
    80001cb8:	00113423          	sd	ra,8(sp)
    80001cbc:	00813023          	sd	s0,0(sp)
    80001cc0:	01010413          	addi	s0,sp,16
}
    80001cc4:	00000097          	auipc	ra,0x0
    80001cc8:	fc8080e7          	jalr	-56(ra) # 80001c8c <_ZdlPv>
    80001ccc:	00813083          	ld	ra,8(sp)
    80001cd0:	00013403          	ld	s0,0(sp)
    80001cd4:	01010113          	addi	sp,sp,16
    80001cd8:	00008067          	ret

0000000080001cdc <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80001cdc:	fe010113          	addi	sp,sp,-32
    80001ce0:	00113c23          	sd	ra,24(sp)
    80001ce4:	00813823          	sd	s0,16(sp)
    80001ce8:	00913423          	sd	s1,8(sp)
    80001cec:	02010413          	addi	s0,sp,32
    80001cf0:	00050493          	mv	s1,a0
}
    80001cf4:	00000097          	auipc	ra,0x0
    80001cf8:	f10080e7          	jalr	-240(ra) # 80001c04 <_ZN9SemaphoreD1Ev>
    80001cfc:	00048513          	mv	a0,s1
    80001d00:	00000097          	auipc	ra,0x0
    80001d04:	f8c080e7          	jalr	-116(ra) # 80001c8c <_ZdlPv>
    80001d08:	01813083          	ld	ra,24(sp)
    80001d0c:	01013403          	ld	s0,16(sp)
    80001d10:	00813483          	ld	s1,8(sp)
    80001d14:	02010113          	addi	sp,sp,32
    80001d18:	00008067          	ret

0000000080001d1c <_ZdaPv>:
{
    80001d1c:	ff010113          	addi	sp,sp,-16
    80001d20:	00113423          	sd	ra,8(sp)
    80001d24:	00813023          	sd	s0,0(sp)
    80001d28:	01010413          	addi	s0,sp,16
    mem_free(p);
    80001d2c:	fffff097          	auipc	ra,0xfffff
    80001d30:	558080e7          	jalr	1368(ra) # 80001284 <_Z8mem_freePv>
}
    80001d34:	00813083          	ld	ra,8(sp)
    80001d38:	00013403          	ld	s0,0(sp)
    80001d3c:	01010113          	addi	sp,sp,16
    80001d40:	00008067          	ret

0000000080001d44 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80001d44:	ff010113          	addi	sp,sp,-16
    80001d48:	00113423          	sd	ra,8(sp)
    80001d4c:	00813023          	sd	s0,0(sp)
    80001d50:	01010413          	addi	s0,sp,16
    80001d54:	00006797          	auipc	a5,0x6
    80001d58:	8ac78793          	addi	a5,a5,-1876 # 80007600 <_ZTV6Thread+0x10>
    80001d5c:	00f53023          	sd	a5,0(a0)
    thread_create_v2(&myHandle,body,arg);
    80001d60:	00850513          	addi	a0,a0,8
    80001d64:	fffff097          	auipc	ra,0xfffff
    80001d68:	7c8080e7          	jalr	1992(ra) # 8000152c <_Z16thread_create_v2PP12KernelThreadPFvPvES2_>
}
    80001d6c:	00813083          	ld	ra,8(sp)
    80001d70:	00013403          	ld	s0,0(sp)
    80001d74:	01010113          	addi	sp,sp,16
    80001d78:	00008067          	ret

0000000080001d7c <_ZN6Thread5startEv>:
int Thread::start() {
    80001d7c:	ff010113          	addi	sp,sp,-16
    80001d80:	00113423          	sd	ra,8(sp)
    80001d84:	00813023          	sd	s0,0(sp)
    80001d88:	01010413          	addi	s0,sp,16
    return thread_start(myHandle);
    80001d8c:	00853503          	ld	a0,8(a0)
    80001d90:	fffff097          	auipc	ra,0xfffff
    80001d94:	770080e7          	jalr	1904(ra) # 80001500 <_Z12thread_startP12KernelThread>
}
    80001d98:	00813083          	ld	ra,8(sp)
    80001d9c:	00013403          	ld	s0,0(sp)
    80001da0:	01010113          	addi	sp,sp,16
    80001da4:	00008067          	ret

0000000080001da8 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80001da8:	ff010113          	addi	sp,sp,-16
    80001dac:	00113423          	sd	ra,8(sp)
    80001db0:	00813023          	sd	s0,0(sp)
    80001db4:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001db8:	fffff097          	auipc	ra,0xfffff
    80001dbc:	5bc080e7          	jalr	1468(ra) # 80001374 <_Z15thread_dispatchv>
}
    80001dc0:	00813083          	ld	ra,8(sp)
    80001dc4:	00013403          	ld	s0,0(sp)
    80001dc8:	01010113          	addi	sp,sp,16
    80001dcc:	00008067          	ret

0000000080001dd0 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time) {
    80001dd0:	ff010113          	addi	sp,sp,-16
    80001dd4:	00113423          	sd	ra,8(sp)
    80001dd8:	00813023          	sd	s0,0(sp)
    80001ddc:	01010413          	addi	s0,sp,16
    return time_sleep(time);
    80001de0:	fffff097          	auipc	ra,0xfffff
    80001de4:	668080e7          	jalr	1640(ra) # 80001448 <_Z10time_sleepm>
}
    80001de8:	00813083          	ld	ra,8(sp)
    80001dec:	00013403          	ld	s0,0(sp)
    80001df0:	01010113          	addi	sp,sp,16
    80001df4:	00008067          	ret

0000000080001df8 <_ZN6ThreadC1Ev>:
Thread::Thread() : Thread(threadWrapper,(void*)this){
    80001df8:	ff010113          	addi	sp,sp,-16
    80001dfc:	00113423          	sd	ra,8(sp)
    80001e00:	00813023          	sd	s0,0(sp)
    80001e04:	01010413          	addi	s0,sp,16
    80001e08:	00050613          	mv	a2,a0
    80001e0c:	00000597          	auipc	a1,0x0
    80001e10:	d9458593          	addi	a1,a1,-620 # 80001ba0 <_ZN6Thread13threadWrapperEPv>
    80001e14:	00000097          	auipc	ra,0x0
    80001e18:	f30080e7          	jalr	-208(ra) # 80001d44 <_ZN6ThreadC1EPFvPvES0_>
}
    80001e1c:	00813083          	ld	ra,8(sp)
    80001e20:	00013403          	ld	s0,0(sp)
    80001e24:	01010113          	addi	sp,sp,16
    80001e28:	00008067          	ret

0000000080001e2c <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80001e2c:	ff010113          	addi	sp,sp,-16
    80001e30:	00113423          	sd	ra,8(sp)
    80001e34:	00813023          	sd	s0,0(sp)
    80001e38:	01010413          	addi	s0,sp,16
    80001e3c:	00005797          	auipc	a5,0x5
    80001e40:	7ec78793          	addi	a5,a5,2028 # 80007628 <_ZTV9Semaphore+0x10>
    80001e44:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle,init);
    80001e48:	00850513          	addi	a0,a0,8
    80001e4c:	fffff097          	auipc	ra,0xfffff
    80001e50:	548080e7          	jalr	1352(ra) # 80001394 <_Z8sem_openPP15KernelSemaphorej>
}
    80001e54:	00813083          	ld	ra,8(sp)
    80001e58:	00013403          	ld	s0,0(sp)
    80001e5c:	01010113          	addi	sp,sp,16
    80001e60:	00008067          	ret

0000000080001e64 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80001e64:	ff010113          	addi	sp,sp,-16
    80001e68:	00113423          	sd	ra,8(sp)
    80001e6c:	00813023          	sd	s0,0(sp)
    80001e70:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80001e74:	00853503          	ld	a0,8(a0)
    80001e78:	fffff097          	auipc	ra,0xfffff
    80001e7c:	578080e7          	jalr	1400(ra) # 800013f0 <_Z8sem_waitP15KernelSemaphore>
}
    80001e80:	00813083          	ld	ra,8(sp)
    80001e84:	00013403          	ld	s0,0(sp)
    80001e88:	01010113          	addi	sp,sp,16
    80001e8c:	00008067          	ret

0000000080001e90 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80001e90:	ff010113          	addi	sp,sp,-16
    80001e94:	00113423          	sd	ra,8(sp)
    80001e98:	00813023          	sd	s0,0(sp)
    80001e9c:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80001ea0:	00853503          	ld	a0,8(a0)
    80001ea4:	fffff097          	auipc	ra,0xfffff
    80001ea8:	578080e7          	jalr	1400(ra) # 8000141c <_Z10sem_signalP15KernelSemaphore>
}
    80001eac:	00813083          	ld	ra,8(sp)
    80001eb0:	00013403          	ld	s0,0(sp)
    80001eb4:	01010113          	addi	sp,sp,16
    80001eb8:	00008067          	ret

0000000080001ebc <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(periodicThreadWrapper, (void*)(new periodic(period,this))) {
    80001ebc:	fe010113          	addi	sp,sp,-32
    80001ec0:	00113c23          	sd	ra,24(sp)
    80001ec4:	00813823          	sd	s0,16(sp)
    80001ec8:	00913423          	sd	s1,8(sp)
    80001ecc:	01213023          	sd	s2,0(sp)
    80001ed0:	02010413          	addi	s0,sp,32
    80001ed4:	00050493          	mv	s1,a0
    80001ed8:	00058913          	mv	s2,a1
    80001edc:	01000513          	li	a0,16
    80001ee0:	00000097          	auipc	ra,0x0
    80001ee4:	d5c080e7          	jalr	-676(ra) # 80001c3c <_Znwm>
    80001ee8:	00050613          	mv	a2,a0
private:

    struct periodic{
        time_t period;
        PeriodicThread * thread;
        periodic(time_t per, PeriodicThread* t) : period(per), thread(t){}
    80001eec:	01253023          	sd	s2,0(a0)
    80001ef0:	00953423          	sd	s1,8(a0)
    80001ef4:	00000597          	auipc	a1,0x0
    80001ef8:	cd858593          	addi	a1,a1,-808 # 80001bcc <_ZN14PeriodicThread21periodicThreadWrapperEPv>
    80001efc:	00048513          	mv	a0,s1
    80001f00:	00000097          	auipc	ra,0x0
    80001f04:	e44080e7          	jalr	-444(ra) # 80001d44 <_ZN6ThreadC1EPFvPvES0_>
    80001f08:	00005797          	auipc	a5,0x5
    80001f0c:	6c878793          	addi	a5,a5,1736 # 800075d0 <_ZTV14PeriodicThread+0x10>
    80001f10:	00f4b023          	sd	a5,0(s1)
}
    80001f14:	01813083          	ld	ra,24(sp)
    80001f18:	01013403          	ld	s0,16(sp)
    80001f1c:	00813483          	ld	s1,8(sp)
    80001f20:	00013903          	ld	s2,0(sp)
    80001f24:	02010113          	addi	sp,sp,32
    80001f28:	00008067          	ret

0000000080001f2c <_ZN7Console4getcEv>:
    }
}

char Console::getc() {
    80001f2c:	ff010113          	addi	sp,sp,-16
    80001f30:	00113423          	sd	ra,8(sp)
    80001f34:	00813023          	sd	s0,0(sp)
    80001f38:	01010413          	addi	s0,sp,16
    return ::getc();
    80001f3c:	fffff097          	auipc	ra,0xfffff
    80001f40:	538080e7          	jalr	1336(ra) # 80001474 <_Z4getcv>
}
    80001f44:	00813083          	ld	ra,8(sp)
    80001f48:	00013403          	ld	s0,0(sp)
    80001f4c:	01010113          	addi	sp,sp,16
    80001f50:	00008067          	ret

0000000080001f54 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80001f54:	ff010113          	addi	sp,sp,-16
    80001f58:	00113423          	sd	ra,8(sp)
    80001f5c:	00813023          	sd	s0,0(sp)
    80001f60:	01010413          	addi	s0,sp,16
    ::putc(c);
    80001f64:	fffff097          	auipc	ra,0xfffff
    80001f68:	538080e7          	jalr	1336(ra) # 8000149c <_Z4putcc>
}
    80001f6c:	00813083          	ld	ra,8(sp)
    80001f70:	00013403          	ld	s0,0(sp)
    80001f74:	01010113          	addi	sp,sp,16
    80001f78:	00008067          	ret

0000000080001f7c <_ZN6Thread3runEv>:
    virtual void run () {}
    80001f7c:	ff010113          	addi	sp,sp,-16
    80001f80:	00813423          	sd	s0,8(sp)
    80001f84:	01010413          	addi	s0,sp,16
    80001f88:	00813403          	ld	s0,8(sp)
    80001f8c:	01010113          	addi	sp,sp,16
    80001f90:	00008067          	ret

0000000080001f94 <_ZN14PeriodicThread18periodicActivationEv>:
    virtual void periodicActivation () {}
    80001f94:	ff010113          	addi	sp,sp,-16
    80001f98:	00813423          	sd	s0,8(sp)
    80001f9c:	01010413          	addi	s0,sp,16
    80001fa0:	00813403          	ld	s0,8(sp)
    80001fa4:	01010113          	addi	sp,sp,16
    80001fa8:	00008067          	ret

0000000080001fac <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80001fac:	ff010113          	addi	sp,sp,-16
    80001fb0:	00813423          	sd	s0,8(sp)
    80001fb4:	01010413          	addi	s0,sp,16
    80001fb8:	00005797          	auipc	a5,0x5
    80001fbc:	61878793          	addi	a5,a5,1560 # 800075d0 <_ZTV14PeriodicThread+0x10>
    80001fc0:	00f53023          	sd	a5,0(a0)
    80001fc4:	00813403          	ld	s0,8(sp)
    80001fc8:	01010113          	addi	sp,sp,16
    80001fcc:	00008067          	ret

0000000080001fd0 <_ZN14PeriodicThreadD0Ev>:
    80001fd0:	ff010113          	addi	sp,sp,-16
    80001fd4:	00113423          	sd	ra,8(sp)
    80001fd8:	00813023          	sd	s0,0(sp)
    80001fdc:	01010413          	addi	s0,sp,16
    80001fe0:	00005797          	auipc	a5,0x5
    80001fe4:	5f078793          	addi	a5,a5,1520 # 800075d0 <_ZTV14PeriodicThread+0x10>
    80001fe8:	00f53023          	sd	a5,0(a0)
    80001fec:	00000097          	auipc	ra,0x0
    80001ff0:	ca0080e7          	jalr	-864(ra) # 80001c8c <_ZdlPv>
    80001ff4:	00813083          	ld	ra,8(sp)
    80001ff8:	00013403          	ld	s0,0(sp)
    80001ffc:	01010113          	addi	sp,sp,16
    80002000:	00008067          	ret

0000000080002004 <_ZN15KernelSemaphore7destroyEPS_>:
int KernelSemaphore::signal() {
    if (++val <= 0)unblock();
    return 0;
}

int KernelSemaphore::destroy(KernelSemaphore*p) {
    80002004:	fd010113          	addi	sp,sp,-48
    80002008:	02113423          	sd	ra,40(sp)
    8000200c:	02813023          	sd	s0,32(sp)
    80002010:	00913c23          	sd	s1,24(sp)
    80002014:	01213823          	sd	s2,16(sp)
    80002018:	01313423          	sd	s3,8(sp)
    8000201c:	01413023          	sd	s4,0(sp)
    80002020:	03010413          	addi	s0,sp,48
    80002024:	00050a13          	mv	s4,a0
    KernelSemaphore::node* tr = p->head;
    80002028:	00053483          	ld	s1,0(a0)
    int vrati = 0;
    8000202c:	00000993          	li	s3,0
    80002030:	00c0006f          	j	8000203c <_ZN15KernelSemaphore7destroyEPS_+0x38>
            Scheduler::put(tr->info);
            tr->info->retVal=-1;
            KernelSemaphore::node* temp = tr;
            tr = tr->next;
            int r = MemoryAllocator::free(temp);
            if(r != 0) vrati = -1;
    80002034:	fff00993          	li	s3,-1
    80002038:	00090493          	mv	s1,s2
        if(tr == nullptr) break;
    8000203c:	02048a63          	beqz	s1,80002070 <_ZN15KernelSemaphore7destroyEPS_+0x6c>
            Scheduler::put(tr->info);
    80002040:	0004b503          	ld	a0,0(s1)
    80002044:	00000097          	auipc	ra,0x0
    80002048:	938080e7          	jalr	-1736(ra) # 8000197c <_ZN9Scheduler3putEP12KernelThread>
            tr->info->retVal=-1;
    8000204c:	0004b783          	ld	a5,0(s1)
    80002050:	fff00713          	li	a4,-1
    80002054:	02e7a623          	sw	a4,44(a5)
            tr = tr->next;
    80002058:	0084b903          	ld	s2,8(s1)
            int r = MemoryAllocator::free(temp);
    8000205c:	00048513          	mv	a0,s1
    80002060:	00001097          	auipc	ra,0x1
    80002064:	a48080e7          	jalr	-1464(ra) # 80002aa8 <_ZN15MemoryAllocator4freeEPv>
            if(r != 0) vrati = -1;
    80002068:	fc0516e3          	bnez	a0,80002034 <_ZN15KernelSemaphore7destroyEPS_+0x30>
    8000206c:	fcdff06f          	j	80002038 <_ZN15KernelSemaphore7destroyEPS_+0x34>
        }
    }
    int r = MemoryAllocator::free(p);
    80002070:	000a0513          	mv	a0,s4
    80002074:	00001097          	auipc	ra,0x1
    80002078:	a34080e7          	jalr	-1484(ra) # 80002aa8 <_ZN15MemoryAllocator4freeEPv>
    if(r!=0)vrati = -1;
    8000207c:	02051463          	bnez	a0,800020a4 <_ZN15KernelSemaphore7destroyEPS_+0xa0>
    return vrati;
}
    80002080:	00098513          	mv	a0,s3
    80002084:	02813083          	ld	ra,40(sp)
    80002088:	02013403          	ld	s0,32(sp)
    8000208c:	01813483          	ld	s1,24(sp)
    80002090:	01013903          	ld	s2,16(sp)
    80002094:	00813983          	ld	s3,8(sp)
    80002098:	00013a03          	ld	s4,0(sp)
    8000209c:	03010113          	addi	sp,sp,48
    800020a0:	00008067          	ret
    if(r!=0)vrati = -1;
    800020a4:	fff00993          	li	s3,-1
    800020a8:	fd9ff06f          	j	80002080 <_ZN15KernelSemaphore7destroyEPS_+0x7c>

00000000800020ac <_ZN15KernelSemaphore15createSemaphoreEPPS_i>:

int KernelSemaphore::createSemaphore(KernelSemaphore **handle, int startVal) {
    800020ac:	fe010113          	addi	sp,sp,-32
    800020b0:	00113c23          	sd	ra,24(sp)
    800020b4:	00813823          	sd	s0,16(sp)
    800020b8:	00913423          	sd	s1,8(sp)
    800020bc:	01213023          	sd	s2,0(sp)
    800020c0:	02010413          	addi	s0,sp,32
    800020c4:	00050493          	mv	s1,a0
    800020c8:	00058913          	mv	s2,a1
    size_t size = sizeof(KernelSemaphore);
    size_t sz = MemoryAllocator::roundToNumOfBlocks(size);
    800020cc:	01800513          	li	a0,24
    800020d0:	00001097          	auipc	ra,0x1
    800020d4:	850080e7          	jalr	-1968(ra) # 80002920 <_ZN15MemoryAllocator18roundToNumOfBlocksEm>

    KernelSemaphore*tr;
    tr = (KernelSemaphore*)MemoryAllocator::malloc(sz);
    800020d8:	00001097          	auipc	ra,0x1
    800020dc:	8c4080e7          	jalr	-1852(ra) # 8000299c <_ZN15MemoryAllocator6mallocEm>
    if(!tr)return -1;
    800020e0:	02050863          	beqz	a0,80002110 <_ZN15KernelSemaphore15createSemaphoreEPPS_i+0x64>
    tr->head=nullptr;
    800020e4:	00053023          	sd	zero,0(a0)
    tr->tail=nullptr;
    800020e8:	00053423          	sd	zero,8(a0)
    tr->val=startVal;
    800020ec:	01252823          	sw	s2,16(a0)
    *handle=tr;
    800020f0:	00a4b023          	sd	a0,0(s1)
    return 0;
    800020f4:	00000513          	li	a0,0
}
    800020f8:	01813083          	ld	ra,24(sp)
    800020fc:	01013403          	ld	s0,16(sp)
    80002100:	00813483          	ld	s1,8(sp)
    80002104:	00013903          	ld	s2,0(sp)
    80002108:	02010113          	addi	sp,sp,32
    8000210c:	00008067          	ret
    if(!tr)return -1;
    80002110:	fff00513          	li	a0,-1
    80002114:	fe5ff06f          	j	800020f8 <_ZN15KernelSemaphore15createSemaphoreEPPS_i+0x4c>

0000000080002118 <_ZN15KernelSemaphore3getEv>:

KernelThread *KernelSemaphore::get() {
    80002118:	fe010113          	addi	sp,sp,-32
    8000211c:	00113c23          	sd	ra,24(sp)
    80002120:	00813823          	sd	s0,16(sp)
    80002124:	00913423          	sd	s1,8(sp)
    80002128:	02010413          	addi	s0,sp,32
    8000212c:	00050793          	mv	a5,a0
    if (!head)return nullptr;
    80002130:	00053503          	ld	a0,0(a0)
    80002134:	02050e63          	beqz	a0,80002170 <_ZN15KernelSemaphore3getEv+0x58>
    node *tr = head;
    head = head->next;
    80002138:	00853703          	ld	a4,8(a0)
    8000213c:	00e7b023          	sd	a4,0(a5)
    if(!head)tail=nullptr;
    80002140:	02070463          	beqz	a4,80002168 <_ZN15KernelSemaphore3getEv+0x50>
    KernelThread*ret = tr->info;
    80002144:	00053483          	ld	s1,0(a0)
    MemoryAllocator::free((void*)tr);
    80002148:	00001097          	auipc	ra,0x1
    8000214c:	960080e7          	jalr	-1696(ra) # 80002aa8 <_ZN15MemoryAllocator4freeEPv>
    return ret;
}
    80002150:	00048513          	mv	a0,s1
    80002154:	01813083          	ld	ra,24(sp)
    80002158:	01013403          	ld	s0,16(sp)
    8000215c:	00813483          	ld	s1,8(sp)
    80002160:	02010113          	addi	sp,sp,32
    80002164:	00008067          	ret
    if(!head)tail=nullptr;
    80002168:	0007b423          	sd	zero,8(a5)
    8000216c:	fd9ff06f          	j	80002144 <_ZN15KernelSemaphore3getEv+0x2c>
    if (!head)return nullptr;
    80002170:	00050493          	mv	s1,a0
    80002174:	fddff06f          	j	80002150 <_ZN15KernelSemaphore3getEv+0x38>

0000000080002178 <_ZN15KernelSemaphore7unblockEv>:
void KernelSemaphore::unblock() {
    80002178:	ff010113          	addi	sp,sp,-16
    8000217c:	00113423          	sd	ra,8(sp)
    80002180:	00813023          	sd	s0,0(sp)
    80002184:	01010413          	addi	s0,sp,16
    KernelThread*t = get();
    80002188:	00000097          	auipc	ra,0x0
    8000218c:	f90080e7          	jalr	-112(ra) # 80002118 <_ZN15KernelSemaphore3getEv>
    if(t)Scheduler::put(t);
    80002190:	00050663          	beqz	a0,8000219c <_ZN15KernelSemaphore7unblockEv+0x24>
    80002194:	fffff097          	auipc	ra,0xfffff
    80002198:	7e8080e7          	jalr	2024(ra) # 8000197c <_ZN9Scheduler3putEP12KernelThread>
}
    8000219c:	00813083          	ld	ra,8(sp)
    800021a0:	00013403          	ld	s0,0(sp)
    800021a4:	01010113          	addi	sp,sp,16
    800021a8:	00008067          	ret

00000000800021ac <_ZN15KernelSemaphore6signalEv>:
    if (++val <= 0)unblock();
    800021ac:	01052783          	lw	a5,16(a0)
    800021b0:	0017879b          	addiw	a5,a5,1
    800021b4:	0007871b          	sext.w	a4,a5
    800021b8:	00f52823          	sw	a5,16(a0)
    800021bc:	00e05663          	blez	a4,800021c8 <_ZN15KernelSemaphore6signalEv+0x1c>
}
    800021c0:	00000513          	li	a0,0
    800021c4:	00008067          	ret
int KernelSemaphore::signal() {
    800021c8:	ff010113          	addi	sp,sp,-16
    800021cc:	00113423          	sd	ra,8(sp)
    800021d0:	00813023          	sd	s0,0(sp)
    800021d4:	01010413          	addi	s0,sp,16
    if (++val <= 0)unblock();
    800021d8:	00000097          	auipc	ra,0x0
    800021dc:	fa0080e7          	jalr	-96(ra) # 80002178 <_ZN15KernelSemaphore7unblockEv>
}
    800021e0:	00000513          	li	a0,0
    800021e4:	00813083          	ld	ra,8(sp)
    800021e8:	00013403          	ld	s0,0(sp)
    800021ec:	01010113          	addi	sp,sp,16
    800021f0:	00008067          	ret

00000000800021f4 <_ZN15KernelSemaphore3putEP12KernelThread>:

void KernelSemaphore::put(KernelThread* k) {
    800021f4:	fe010113          	addi	sp,sp,-32
    800021f8:	00113c23          	sd	ra,24(sp)
    800021fc:	00813823          	sd	s0,16(sp)
    80002200:	00913423          	sd	s1,8(sp)
    80002204:	01213023          	sd	s2,0(sp)
    80002208:	02010413          	addi	s0,sp,32
    8000220c:	00050493          	mv	s1,a0
    80002210:	00058913          	mv	s2,a1
    size_t size = sizeof(node);
    size_t sz = MemoryAllocator::roundToNumOfBlocks(size);
    80002214:	01000513          	li	a0,16
    80002218:	00000097          	auipc	ra,0x0
    8000221c:	708080e7          	jalr	1800(ra) # 80002920 <_ZN15MemoryAllocator18roundToNumOfBlocksEm>

    if(!head){
    80002220:	0004b783          	ld	a5,0(s1)
    80002224:	04078063          	beqz	a5,80002264 <_ZN15KernelSemaphore3putEP12KernelThread+0x70>
        head->info =k;
        tail = head;
    }
    else{
        node* tr;
        tr = (node*)MemoryAllocator::malloc(sz);
    80002228:	00000097          	auipc	ra,0x0
    8000222c:	774080e7          	jalr	1908(ra) # 8000299c <_ZN15MemoryAllocator6mallocEm>
        tr->next = nullptr;
    80002230:	00053423          	sd	zero,8(a0)
        tr->info = k;
    80002234:	01253023          	sd	s2,0(a0)
        tail->next=tr;
    80002238:	0084b783          	ld	a5,8(s1)
    8000223c:	00a7b423          	sd	a0,8(a5)
        tail = tail->next;
    80002240:	0084b783          	ld	a5,8(s1)
    80002244:	0087b783          	ld	a5,8(a5)
    80002248:	00f4b423          	sd	a5,8(s1)
    }
}
    8000224c:	01813083          	ld	ra,24(sp)
    80002250:	01013403          	ld	s0,16(sp)
    80002254:	00813483          	ld	s1,8(sp)
    80002258:	00013903          	ld	s2,0(sp)
    8000225c:	02010113          	addi	sp,sp,32
    80002260:	00008067          	ret
        head =(node*)MemoryAllocator::malloc(sz);
    80002264:	00000097          	auipc	ra,0x0
    80002268:	738080e7          	jalr	1848(ra) # 8000299c <_ZN15MemoryAllocator6mallocEm>
    8000226c:	00a4b023          	sd	a0,0(s1)
        head->next = nullptr;
    80002270:	00053423          	sd	zero,8(a0)
        head->info =k;
    80002274:	0004b783          	ld	a5,0(s1)
    80002278:	0127b023          	sd	s2,0(a5)
        tail = head;
    8000227c:	0004b783          	ld	a5,0(s1)
    80002280:	00f4b423          	sd	a5,8(s1)
    80002284:	fc9ff06f          	j	8000224c <_ZN15KernelSemaphore3putEP12KernelThread+0x58>

0000000080002288 <_ZN15KernelSemaphore5blockEv>:
void KernelSemaphore::block() {
    80002288:	ff010113          	addi	sp,sp,-16
    8000228c:	00113423          	sd	ra,8(sp)
    80002290:	00813023          	sd	s0,0(sp)
    80002294:	01010413          	addi	s0,sp,16
    put(KernelThread::running);
    80002298:	00005797          	auipc	a5,0x5
    8000229c:	4687b783          	ld	a5,1128(a5) # 80007700 <_GLOBAL_OFFSET_TABLE_+0x30>
    800022a0:	0007b583          	ld	a1,0(a5)
    800022a4:	00000097          	auipc	ra,0x0
    800022a8:	f50080e7          	jalr	-176(ra) # 800021f4 <_ZN15KernelSemaphore3putEP12KernelThread>
    KernelThread::dispatchNoScheduler();
    800022ac:	00001097          	auipc	ra,0x1
    800022b0:	ae8080e7          	jalr	-1304(ra) # 80002d94 <_ZN12KernelThread19dispatchNoSchedulerEv>
}
    800022b4:	00813083          	ld	ra,8(sp)
    800022b8:	00013403          	ld	s0,0(sp)
    800022bc:	01010113          	addi	sp,sp,16
    800022c0:	00008067          	ret

00000000800022c4 <_ZN15KernelSemaphore4waitEv>:
    if(--val<0)block();
    800022c4:	01052783          	lw	a5,16(a0)
    800022c8:	fff7879b          	addiw	a5,a5,-1
    800022cc:	00f52823          	sw	a5,16(a0)
    800022d0:	02079713          	slli	a4,a5,0x20
    800022d4:	02074263          	bltz	a4,800022f8 <_ZN15KernelSemaphore4waitEv+0x34>
    if(KernelThread::running->retVal==-1){
    800022d8:	00005797          	auipc	a5,0x5
    800022dc:	4287b783          	ld	a5,1064(a5) # 80007700 <_GLOBAL_OFFSET_TABLE_+0x30>
    800022e0:	0007b783          	ld	a5,0(a5)
    800022e4:	02c7a503          	lw	a0,44(a5)
    800022e8:	fff00713          	li	a4,-1
    800022ec:	04e50c63          	beq	a0,a4,80002344 <_ZN15KernelSemaphore4waitEv+0x80>
    return 0;
    800022f0:	00000513          	li	a0,0
}
    800022f4:	00008067          	ret
int KernelSemaphore::wait() {
    800022f8:	ff010113          	addi	sp,sp,-16
    800022fc:	00113423          	sd	ra,8(sp)
    80002300:	00813023          	sd	s0,0(sp)
    80002304:	01010413          	addi	s0,sp,16
    if(--val<0)block();
    80002308:	00000097          	auipc	ra,0x0
    8000230c:	f80080e7          	jalr	-128(ra) # 80002288 <_ZN15KernelSemaphore5blockEv>
    if(KernelThread::running->retVal==-1){
    80002310:	00005797          	auipc	a5,0x5
    80002314:	3f07b783          	ld	a5,1008(a5) # 80007700 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002318:	0007b783          	ld	a5,0(a5)
    8000231c:	02c7a503          	lw	a0,44(a5)
    80002320:	fff00713          	li	a4,-1
    80002324:	00e50c63          	beq	a0,a4,8000233c <_ZN15KernelSemaphore4waitEv+0x78>
    return 0;
    80002328:	00000513          	li	a0,0
}
    8000232c:	00813083          	ld	ra,8(sp)
    80002330:	00013403          	ld	s0,0(sp)
    80002334:	01010113          	addi	sp,sp,16
    80002338:	00008067          	ret
        KernelThread::running->retVal=0;
    8000233c:	0207a623          	sw	zero,44(a5)
        return -1;
    80002340:	fedff06f          	j	8000232c <_ZN15KernelSemaphore4waitEv+0x68>
        KernelThread::running->retVal=0;
    80002344:	0207a623          	sw	zero,44(a5)
        return -1;
    80002348:	00008067          	ret

000000008000234c <handleRoutine>:
#include "../h/KernelSemaphore.hpp"
#include "../h/KernelBuffer.hpp"
#include "../h/Timer.hpp"
#include "../lib/console.h"

extern "C" void handleRoutine(){//read a7...a0
    8000234c:	f9010113          	addi	sp,sp,-112
    80002350:	06113423          	sd	ra,104(sp)
    80002354:	06813023          	sd	s0,96(sp)
    80002358:	04913c23          	sd	s1,88(sp)
    8000235c:	05213823          	sd	s2,80(sp)
    80002360:	05313423          	sd	s3,72(sp)
    80002364:	07010413          	addi	s0,sp,112

    uint64 a7, a6, a5, a4, a3, a2, a1, a0;

    __asm__ volatile("sd a7, %0":"=m"(a7));
    80002368:	fd143423          	sd	a7,-56(s0)
    __asm__ volatile("sd a6, %0":"=m"(a6));
    8000236c:	fd043023          	sd	a6,-64(s0)
    __asm__ volatile("sd a5, %0":"=m"(a5));
    80002370:	faf43c23          	sd	a5,-72(s0)
    __asm__ volatile("sd a4, %0":"=m"(a4));
    80002374:	fae43823          	sd	a4,-80(s0)
    __asm__ volatile("sd a3, %0":"=m"(a3));
    80002378:	fad43423          	sd	a3,-88(s0)
    __asm__ volatile("sd a2, %0":"=m"(a2));
    8000237c:	fac43023          	sd	a2,-96(s0)
    __asm__ volatile("sd a1, %0":"=m"(a1));
    80002380:	f8b43c23          	sd	a1,-104(s0)
    __asm__ volatile("sd a0, %0":"=m"(a0));
    80002384:	f8a43823          	sd	a0,-112(s0)

    uint64 scauseVar;
    uint64 sepcVar;
    uint64 sscratchVar;

    __asm__ volatile ("csrr %0, sscratch": "=r"(sscratchVar));
    80002388:	14002973          	csrr	s2,sscratch
    __asm__ volatile("csrr %0, scause":"=r"(scauseVar));
    8000238c:	14202773          	csrr	a4,scause
    __asm__ volatile("csrr %0, sepc":"=r"(sepcVar));
    80002390:	141024f3          	csrr	s1,sepc

    if(scauseVar == 8UL || scauseVar == 9UL){//if else
    80002394:	ff870693          	addi	a3,a4,-8
    80002398:	00100793          	li	a5,1
    8000239c:	06d7fa63          	bgeu	a5,a3,80002410 <handleRoutine+0xc4>

        sepcVar+=4;
        __asm__ volatile("csrw sepc, %0": :"r"(sepcVar));
        __asm__ volatile("sd a0,0x50(%0)" : : "r"(sscratchVar));
    }
    else if (scauseVar == 0x8000000000000001UL){
    800023a0:	fff00793          	li	a5,-1
    800023a4:	03f79793          	slli	a5,a5,0x3f
    800023a8:	00178793          	addi	a5,a5,1
    800023ac:	34f70063          	beq	a4,a5,800026ec <handleRoutine+0x3a0>
            __asm__ volatile("csrw sepc, %0": :"r"(sepcVar));

        }
        __asm__ volatile ("csrc sip, 0x02");
    }
    else if (scauseVar == 0x8000000000000009UL) {
    800023b0:	fff00793          	li	a5,-1
    800023b4:	03f79793          	slli	a5,a5,0x3f
    800023b8:	00978793          	addi	a5,a5,9
    800023bc:	0ef71e63          	bne	a4,a5,800024b8 <handleRoutine+0x16c>
        if(plic_claim()==CONSOLE_IRQ){
    800023c0:	00002097          	auipc	ra,0x2
    800023c4:	334080e7          	jalr	820(ra) # 800046f4 <plic_claim>
    800023c8:	00a00793          	li	a5,10
    800023cc:	0ef51663          	bne	a0,a5,800024b8 <handleRoutine+0x16c>
            uint8 *rx = (uint8 *) CONSOLE_RX_DATA;
    800023d0:	00005797          	auipc	a5,0x5
    800023d4:	3087b783          	ld	a5,776(a5) # 800076d8 <_GLOBAL_OFFSET_TABLE_+0x8>
    800023d8:	0007b903          	ld	s2,0(a5)
            uint8 *st = (uint8 *) CONSOLE_STATUS;
    800023dc:	00005797          	auipc	a5,0x5
    800023e0:	3047b783          	ld	a5,772(a5) # 800076e0 <_GLOBAL_OFFSET_TABLE_+0x10>
    800023e4:	0007b483          	ld	s1,0(a5)

            while((*st & CONSOLE_RX_STATUS_BIT)){
    800023e8:	0004c783          	lbu	a5,0(s1)
    800023ec:	0017f793          	andi	a5,a5,1
    800023f0:	36078263          	beqz	a5,80002754 <handleRoutine+0x408>
                    rx = (uint8 *) CONSOLE_RX_DATA;
                    KernelBuffer::ulaz->put((char) (*rx));
    800023f4:	00094583          	lbu	a1,0(s2)
    800023f8:	00005797          	auipc	a5,0x5
    800023fc:	3387b783          	ld	a5,824(a5) # 80007730 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002400:	0007b503          	ld	a0,0(a5)
    80002404:	fffff097          	auipc	ra,0xfffff
    80002408:	1c4080e7          	jalr	452(ra) # 800015c8 <_ZN12KernelBuffer3putEc>
    8000240c:	fddff06f          	j	800023e8 <handleRoutine+0x9c>
        if(a0 == 0x01){//mem alloc
    80002410:	f9043783          	ld	a5,-112(s0)
    80002414:	00100713          	li	a4,1
    80002418:	08e78263          	beq	a5,a4,8000249c <handleRoutine+0x150>
        else if (a0 == 0x02){//mem free
    8000241c:	00200713          	li	a4,2
    80002420:	0ae78a63          	beq	a5,a4,800024d4 <handleRoutine+0x188>
        else if (a0 == 0x11){//thread create
    80002424:	01100713          	li	a4,17
    80002428:	0ce78063          	beq	a5,a4,800024e8 <handleRoutine+0x19c>
        else if (a0 == 0x12){//thread exit
    8000242c:	01200713          	li	a4,18
    80002430:	0ce78e63          	beq	a5,a4,8000250c <handleRoutine+0x1c0>
        else if (a0 == 0x13){//thread dispatch
    80002434:	01300713          	li	a4,19
    80002438:	10e78863          	beq	a5,a4,80002548 <handleRoutine+0x1fc>
        else if(a0 == 0x14){
    8000243c:	01400713          	li	a4,20
    80002440:	12e78463          	beq	a5,a4,80002568 <handleRoutine+0x21c>
        else if(a0 == 0x21){//sem open
    80002444:	02100713          	li	a4,33
    80002448:	14e78263          	beq	a5,a4,8000258c <handleRoutine+0x240>
        else if(a0 == 0x22){//sem close
    8000244c:	02200713          	li	a4,34
    80002450:	16e78263          	beq	a5,a4,800025b4 <handleRoutine+0x268>
        else if(a0 == 0x23){//sem wait
    80002454:	02300713          	li	a4,35
    80002458:	18e78063          	beq	a5,a4,800025d8 <handleRoutine+0x28c>
        else if(a0 == 0x24){//sem signal
    8000245c:	02400713          	li	a4,36
    80002460:	1ae78063          	beq	a5,a4,80002600 <handleRoutine+0x2b4>
        else if(a0 == 0x31){//sleep
    80002464:	03100713          	li	a4,49
    80002468:	1ae78e63          	beq	a5,a4,80002624 <handleRoutine+0x2d8>
        else if(a0 == 0x41){//getc
    8000246c:	04100713          	li	a4,65
    80002470:	20e78663          	beq	a5,a4,8000267c <handleRoutine+0x330>
        else if(a0 == 0x42){//putc
    80002474:	04200713          	li	a4,66
    80002478:	22e78a63          	beq	a5,a4,800026ac <handleRoutine+0x360>
        else if(a0 == 0x51){//change to user
    8000247c:	05100713          	li	a4,81
    80002480:	24e78e63          	beq	a5,a4,800026dc <handleRoutine+0x390>
        else if(a0 == 0x52){//change to privileged
    80002484:	05200713          	li	a4,82
    80002488:	02e79263          	bne	a5,a4,800024ac <handleRoutine+0x160>
            __asm__ volatile("csrr %0, sstatus" : "=r" (sstatusVar));
    8000248c:	100027f3          	csrr	a5,sstatus
            sstatusVar |= 0x100;
    80002490:	1007e793          	ori	a5,a5,256
            __asm__ volatile("csrw sstatus, %0" : : "r" (sstatusVar));
    80002494:	10079073          	csrw	sstatus,a5
    80002498:	0140006f          	j	800024ac <handleRoutine+0x160>
            void*retValue=MemoryAllocator::malloc(a1);
    8000249c:	f9843503          	ld	a0,-104(s0)
    800024a0:	00000097          	auipc	ra,0x0
    800024a4:	4fc080e7          	jalr	1276(ra) # 8000299c <_ZN15MemoryAllocator6mallocEm>
            __asm__ volatile("mv a0, %0" : : "r" (retValue));
    800024a8:	00050513          	mv	a0,a0
        sepcVar+=4;
    800024ac:	00448493          	addi	s1,s1,4
        __asm__ volatile("csrw sepc, %0": :"r"(sepcVar));
    800024b0:	14149073          	csrw	sepc,s1
        __asm__ volatile("sd a0,0x50(%0)" : : "r"(sscratchVar));
    800024b4:	04a93823          	sd	a0,80(s2)
            }
            plic_complete(CONSOLE_IRQ);
        }
    }
   // console_handler();
    800024b8:	06813083          	ld	ra,104(sp)
    800024bc:	06013403          	ld	s0,96(sp)
    800024c0:	05813483          	ld	s1,88(sp)
    800024c4:	05013903          	ld	s2,80(sp)
    800024c8:	04813983          	ld	s3,72(sp)
    800024cc:	07010113          	addi	sp,sp,112
    800024d0:	00008067          	ret
            int retValue=MemoryAllocator::free((void*)a1);
    800024d4:	f9843503          	ld	a0,-104(s0)
    800024d8:	00000097          	auipc	ra,0x0
    800024dc:	5d0080e7          	jalr	1488(ra) # 80002aa8 <_ZN15MemoryAllocator4freeEPv>
            __asm__ volatile("mv a0, %0" : : "r" (retValue));
    800024e0:	00050513          	mv	a0,a0
    800024e4:	fc9ff06f          	j	800024ac <handleRoutine+0x160>
            int retValue = KernelThread::createCoroutine(handle, b, stack, arg,a5);
    800024e8:	fb843703          	ld	a4,-72(s0)
    800024ec:	fa843683          	ld	a3,-88(s0)
    800024f0:	fb043603          	ld	a2,-80(s0)
    800024f4:	fa043583          	ld	a1,-96(s0)
    800024f8:	f9843503          	ld	a0,-104(s0)
    800024fc:	00000097          	auipc	ra,0x0
    80002500:	650080e7          	jalr	1616(ra) # 80002b4c <_ZN12KernelThread15createCoroutineEPPS_PFvPvEPmS2_m>
            __asm__ volatile("mv a0, %0" : : "r" (retValue));
    80002504:	00050513          	mv	a0,a0
    80002508:	fa5ff06f          	j	800024ac <handleRoutine+0x160>
            if(KernelThread::running != nullptr) {
    8000250c:	00005797          	auipc	a5,0x5
    80002510:	1f47b783          	ld	a5,500(a5) # 80007700 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002514:	0007b503          	ld	a0,0(a5)
    80002518:	02050263          	beqz	a0,8000253c <handleRoutine+0x1f0>
                KernelThread::running->setFinished(true);
    8000251c:	00100593          	li	a1,1
    80002520:	00000097          	auipc	ra,0x0
    80002524:	784080e7          	jalr	1924(ra) # 80002ca4 <_ZN12KernelThread11setFinishedEb>
                KernelThread::yield();
    80002528:	00000097          	auipc	ra,0x0
    8000252c:	798080e7          	jalr	1944(ra) # 80002cc0 <_ZN12KernelThread5yieldEv>
                __asm__ volatile("mv a0, %0" : : "r" (0));
    80002530:	00000793          	li	a5,0
    80002534:	00078513          	mv	a0,a5
    80002538:	f75ff06f          	j	800024ac <handleRoutine+0x160>
                __asm__ volatile("mv a0, %0" : : "r" (-1));
    8000253c:	fff00793          	li	a5,-1
    80002540:	00078513          	mv	a0,a5
    80002544:	f69ff06f          	j	800024ac <handleRoutine+0x160>
            __asm__ volatile ("csrr %0, sepc": "=r"(sepcVar));
    80002548:	141024f3          	csrr	s1,sepc
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
    8000254c:	100027f3          	csrr	a5,sstatus
    80002550:	fcf43423          	sd	a5,-56(s0)
            KernelThread::dispatch();
    80002554:	00000097          	auipc	ra,0x0
    80002558:	78c080e7          	jalr	1932(ra) # 80002ce0 <_ZN12KernelThread8dispatchEv>
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
    8000255c:	fc843783          	ld	a5,-56(s0)
    80002560:	10079073          	csrw	sstatus,a5
    80002564:	f49ff06f          	j	800024ac <handleRoutine+0x160>
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
    80002568:	100027f3          	csrr	a5,sstatus
    8000256c:	fcf43423          	sd	a5,-56(s0)
            int ret = KernelThread::start((KernelThread*)a1);
    80002570:	f9843503          	ld	a0,-104(s0)
    80002574:	00001097          	auipc	ra,0x1
    80002578:	a90080e7          	jalr	-1392(ra) # 80003004 <_ZN12KernelThread5startEPS_>
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
    8000257c:	fc843783          	ld	a5,-56(s0)
    80002580:	10079073          	csrw	sstatus,a5
            __asm__ volatile("mv a0, %0" : : "r" (ret));
    80002584:	00050513          	mv	a0,a0
    80002588:	f25ff06f          	j	800024ac <handleRoutine+0x160>
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
    8000258c:	100027f3          	csrr	a5,sstatus
    80002590:	fcf43423          	sd	a5,-56(s0)
            int retValue = KernelSemaphore::createSemaphore((KernelSemaphore**)(a1),(int)a2);
    80002594:	fa042583          	lw	a1,-96(s0)
    80002598:	f9843503          	ld	a0,-104(s0)
    8000259c:	00000097          	auipc	ra,0x0
    800025a0:	b10080e7          	jalr	-1264(ra) # 800020ac <_ZN15KernelSemaphore15createSemaphoreEPPS_i>
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
    800025a4:	fc843783          	ld	a5,-56(s0)
    800025a8:	10079073          	csrw	sstatus,a5
            __asm__ volatile("mv a0, %0" : : "r" (retValue));
    800025ac:	00050513          	mv	a0,a0
    800025b0:	efdff06f          	j	800024ac <handleRoutine+0x160>
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
    800025b4:	100027f3          	csrr	a5,sstatus
    800025b8:	fcf43423          	sd	a5,-56(s0)
            int retValue = KernelSemaphore::destroy((KernelSemaphore*)a1);
    800025bc:	f9843503          	ld	a0,-104(s0)
    800025c0:	00000097          	auipc	ra,0x0
    800025c4:	a44080e7          	jalr	-1468(ra) # 80002004 <_ZN15KernelSemaphore7destroyEPS_>
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
    800025c8:	fc843783          	ld	a5,-56(s0)
    800025cc:	10079073          	csrw	sstatus,a5
            __asm__ volatile("mv a0, %0" : : "r" (retValue));
    800025d0:	00050513          	mv	a0,a0
    800025d4:	ed9ff06f          	j	800024ac <handleRoutine+0x160>
            __asm__ volatile ("csrr %0, sepc": "=r"(sepcVar));
    800025d8:	141024f3          	csrr	s1,sepc
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
    800025dc:	100027f3          	csrr	a5,sstatus
    800025e0:	fcf43423          	sd	a5,-56(s0)
            int retValue = ((KernelSemaphore*)a1)->wait();
    800025e4:	f9843503          	ld	a0,-104(s0)
    800025e8:	00000097          	auipc	ra,0x0
    800025ec:	cdc080e7          	jalr	-804(ra) # 800022c4 <_ZN15KernelSemaphore4waitEv>
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
    800025f0:	fc843783          	ld	a5,-56(s0)
    800025f4:	10079073          	csrw	sstatus,a5
            __asm__ volatile("mv a0, %0" : : "r" (retValue));
    800025f8:	00050513          	mv	a0,a0
    800025fc:	eb1ff06f          	j	800024ac <handleRoutine+0x160>
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
    80002600:	100027f3          	csrr	a5,sstatus
    80002604:	fcf43423          	sd	a5,-56(s0)
            int retValue = ((KernelSemaphore*)a1)->signal();
    80002608:	f9843503          	ld	a0,-104(s0)
    8000260c:	00000097          	auipc	ra,0x0
    80002610:	ba0080e7          	jalr	-1120(ra) # 800021ac <_ZN15KernelSemaphore6signalEv>
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
    80002614:	fc843783          	ld	a5,-56(s0)
    80002618:	10079073          	csrw	sstatus,a5
            __asm__ volatile("mv a0, %0" : : "r" (retValue));
    8000261c:	00050513          	mv	a0,a0
    80002620:	e8dff06f          	j	800024ac <handleRoutine+0x160>
            KernelThread::timeSliceCounter=0;
    80002624:	00005797          	auipc	a5,0x5
    80002628:	0fc7b783          	ld	a5,252(a5) # 80007720 <_GLOBAL_OFFSET_TABLE_+0x50>
    8000262c:	0007b023          	sd	zero,0(a5)
            int retValue = Timer::addInList(KernelThread::running, a1);
    80002630:	f9843583          	ld	a1,-104(s0)
    80002634:	00005797          	auipc	a5,0x5
    80002638:	0cc7b783          	ld	a5,204(a5) # 80007700 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000263c:	0007b503          	ld	a0,0(a5)
    80002640:	00000097          	auipc	ra,0x0
    80002644:	124080e7          	jalr	292(ra) # 80002764 <_ZN5Timer9addInListEP12KernelThreadm>
    80002648:	00050993          	mv	s3,a0
            __asm__ volatile ("csrr %0, sepc": "=r"(sepcVar));
    8000264c:	141024f3          	csrr	s1,sepc
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
    80002650:	100027f3          	csrr	a5,sstatus
    80002654:	fcf43423          	sd	a5,-56(s0)
            if(retValue!=-1)KernelThread::dispatchNoScheduler();
    80002658:	fff00793          	li	a5,-1
    8000265c:	00f51a63          	bne	a0,a5,80002670 <handleRoutine+0x324>
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
    80002660:	fc843783          	ld	a5,-56(s0)
    80002664:	10079073          	csrw	sstatus,a5
            __asm__ volatile("mv a0, %0" : : "r" (retValue));
    80002668:	00098513          	mv	a0,s3
    8000266c:	e41ff06f          	j	800024ac <handleRoutine+0x160>
            if(retValue!=-1)KernelThread::dispatchNoScheduler();
    80002670:	00000097          	auipc	ra,0x0
    80002674:	724080e7          	jalr	1828(ra) # 80002d94 <_ZN12KernelThread19dispatchNoSchedulerEv>
    80002678:	fe9ff06f          	j	80002660 <handleRoutine+0x314>
            __asm__ volatile ("csrr %0, sepc": "=r"(sepcVar));
    8000267c:	141024f3          	csrr	s1,sepc
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
    80002680:	100027f3          	csrr	a5,sstatus
    80002684:	fcf43423          	sd	a5,-56(s0)
            char c = KernelBuffer::ulaz->get();
    80002688:	00005797          	auipc	a5,0x5
    8000268c:	0a87b783          	ld	a5,168(a5) # 80007730 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002690:	0007b503          	ld	a0,0(a5)
    80002694:	fffff097          	auipc	ra,0xfffff
    80002698:	fac080e7          	jalr	-84(ra) # 80001640 <_ZN12KernelBuffer3getEv>
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
    8000269c:	fc843783          	ld	a5,-56(s0)
    800026a0:	10079073          	csrw	sstatus,a5
            __asm__ volatile("mv a0, %0" : : "r" (c));
    800026a4:	00050513          	mv	a0,a0
    800026a8:	e05ff06f          	j	800024ac <handleRoutine+0x160>
            __asm__ volatile ("csrr %0, sepc": "=r"(sepcVar));
    800026ac:	141024f3          	csrr	s1,sepc
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
    800026b0:	100027f3          	csrr	a5,sstatus
    800026b4:	fcf43423          	sd	a5,-56(s0)
            KernelBuffer::izlaz->put((char)a1);
    800026b8:	f9844583          	lbu	a1,-104(s0)
    800026bc:	00005797          	auipc	a5,0x5
    800026c0:	06c7b783          	ld	a5,108(a5) # 80007728 <_GLOBAL_OFFSET_TABLE_+0x58>
    800026c4:	0007b503          	ld	a0,0(a5)
    800026c8:	fffff097          	auipc	ra,0xfffff
    800026cc:	f00080e7          	jalr	-256(ra) # 800015c8 <_ZN12KernelBuffer3putEc>
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
    800026d0:	fc843783          	ld	a5,-56(s0)
    800026d4:	10079073          	csrw	sstatus,a5
    800026d8:	dd5ff06f          	j	800024ac <handleRoutine+0x160>
            __asm__ volatile("csrr %0, sstatus" : "=r" (sstatusVar));
    800026dc:	100027f3          	csrr	a5,sstatus
            sstatusVar &= ~0x100;
    800026e0:	eff7f793          	andi	a5,a5,-257
            __asm__ volatile("csrw sstatus, %0" : : "r" (sstatusVar));
    800026e4:	10079073          	csrw	sstatus,a5
    800026e8:	dc5ff06f          	j	800024ac <handleRoutine+0x160>
        Timer::updateAll();
    800026ec:	00000097          	auipc	ra,0x0
    800026f0:	1c4080e7          	jalr	452(ra) # 800028b0 <_ZN5Timer9updateAllEv>
        KernelThread::timeSliceCounter++;
    800026f4:	00005497          	auipc	s1,0x5
    800026f8:	02c4b483          	ld	s1,44(s1) # 80007720 <_GLOBAL_OFFSET_TABLE_+0x50>
    800026fc:	0004b783          	ld	a5,0(s1)
    80002700:	00178793          	addi	a5,a5,1
    80002704:	00f4b023          	sd	a5,0(s1)
        if(KernelThread::timeSliceCounter >= KernelThread::running->getTimeSlice()){
    80002708:	00005797          	auipc	a5,0x5
    8000270c:	ff87b783          	ld	a5,-8(a5) # 80007700 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002710:	0007b503          	ld	a0,0(a5)
    80002714:	00001097          	auipc	ra,0x1
    80002718:	81c080e7          	jalr	-2020(ra) # 80002f30 <_ZNK12KernelThread12getTimeSliceEv>
    8000271c:	0004b783          	ld	a5,0(s1)
    80002720:	00a7f663          	bgeu	a5,a0,8000272c <handleRoutine+0x3e0>
        __asm__ volatile ("csrc sip, 0x02");
    80002724:	14417073          	csrci	sip,2
    80002728:	d91ff06f          	j	800024b8 <handleRoutine+0x16c>
            KernelThread::timeSliceCounter = 0;
    8000272c:	0004b023          	sd	zero,0(s1)
            __asm__ volatile("csrr %0, sepc":"=r"(sepcVar));
    80002730:	141024f3          	csrr	s1,sepc
            __asm__ volatile ("csrr %0, sstatus": "=r"(a7));
    80002734:	100027f3          	csrr	a5,sstatus
    80002738:	fcf43423          	sd	a5,-56(s0)
            KernelThread::dispatch();
    8000273c:	00000097          	auipc	ra,0x0
    80002740:	5a4080e7          	jalr	1444(ra) # 80002ce0 <_ZN12KernelThread8dispatchEv>
            __asm__ volatile("csrw sstatus, %0": :"r"(a7));
    80002744:	fc843783          	ld	a5,-56(s0)
    80002748:	10079073          	csrw	sstatus,a5
            __asm__ volatile("csrw sepc, %0": :"r"(sepcVar));
    8000274c:	14149073          	csrw	sepc,s1
    80002750:	fd5ff06f          	j	80002724 <handleRoutine+0x3d8>
            plic_complete(CONSOLE_IRQ);
    80002754:	00a00513          	li	a0,10
    80002758:	00002097          	auipc	ra,0x2
    8000275c:	fd4080e7          	jalr	-44(ra) # 8000472c <plic_complete>
    80002760:	d59ff06f          	j	800024b8 <handleRoutine+0x16c>

0000000080002764 <_ZN5Timer9addInListEP12KernelThreadm>:

#include "../lib/console.h"
Timer::node* Timer::head = nullptr;

int Timer:: addInList(KernelThread *k, uint64 t) {
    if(t==0)return -1;
    80002764:	08058863          	beqz	a1,800027f4 <_ZN5Timer9addInListEP12KernelThreadm+0x90>
int Timer:: addInList(KernelThread *k, uint64 t) {
    80002768:	fe010113          	addi	sp,sp,-32
    8000276c:	00113c23          	sd	ra,24(sp)
    80002770:	00813823          	sd	s0,16(sp)
    80002774:	00913423          	sd	s1,8(sp)
    80002778:	01213023          	sd	s2,0(sp)
    8000277c:	02010413          	addi	s0,sp,32
    80002780:	00050913          	mv	s2,a0
    80002784:	00058493          	mv	s1,a1
    node* temp;
    size_t size = sizeof(Timer::node);
    size_t sz = MemoryAllocator::roundToNumOfBlocks(size);
    80002788:	01800513          	li	a0,24
    8000278c:	00000097          	auipc	ra,0x0
    80002790:	194080e7          	jalr	404(ra) # 80002920 <_ZN15MemoryAllocator18roundToNumOfBlocksEm>


    temp = (node*)MemoryAllocator::malloc(sz);
    80002794:	00000097          	auipc	ra,0x0
    80002798:	208080e7          	jalr	520(ra) # 8000299c <_ZN15MemoryAllocator6mallocEm>
    if(!temp)return -1;
    8000279c:	06050063          	beqz	a0,800027fc <_ZN5Timer9addInListEP12KernelThreadm+0x98>
    temp->next= nullptr;
    800027a0:	00053423          	sd	zero,8(a0)
    temp->timeSliceCounter=t;
    800027a4:	00953823          	sd	s1,16(a0)
    temp->info = k;
    800027a8:	01253023          	sd	s2,0(a0)
    if(head==nullptr){
    800027ac:	00005797          	auipc	a5,0x5
    800027b0:	0047b783          	ld	a5,4(a5) # 800077b0 <_ZN5Timer4headE>
    800027b4:	02078863          	beqz	a5,800027e4 <_ZN5Timer9addInListEP12KernelThreadm+0x80>
        head = temp;
    }
    else{
        node*tr = head;
        while(true){
            if(tr->next==nullptr){
    800027b8:	00078713          	mv	a4,a5
    800027bc:	0087b783          	ld	a5,8(a5)
    800027c0:	fe079ce3          	bnez	a5,800027b8 <_ZN5Timer9addInListEP12KernelThreadm+0x54>
            }
            else{
                tr = tr->next;
            }
        }
        tr->next = temp;
    800027c4:	00a73423          	sd	a0,8(a4)
  /*  printString("Scheduler ima: ");
    printInt(Scheduler::len());
    printString("\nTimer ima: ");
    printInt(len());
    printString("\n");*/
    return 0;
    800027c8:	00000513          	li	a0,0
}
    800027cc:	01813083          	ld	ra,24(sp)
    800027d0:	01013403          	ld	s0,16(sp)
    800027d4:	00813483          	ld	s1,8(sp)
    800027d8:	00013903          	ld	s2,0(sp)
    800027dc:	02010113          	addi	sp,sp,32
    800027e0:	00008067          	ret
        head = temp;
    800027e4:	00005797          	auipc	a5,0x5
    800027e8:	fca7b623          	sd	a0,-52(a5) # 800077b0 <_ZN5Timer4headE>
    return 0;
    800027ec:	00000513          	li	a0,0
    800027f0:	fddff06f          	j	800027cc <_ZN5Timer9addInListEP12KernelThreadm+0x68>
    if(t==0)return -1;
    800027f4:	fff00513          	li	a0,-1
}
    800027f8:	00008067          	ret
    if(!temp)return -1;
    800027fc:	fff00513          	li	a0,-1
    80002800:	fcdff06f          	j	800027cc <_ZN5Timer9addInListEP12KernelThreadm+0x68>

0000000080002804 <_ZN5Timer8checkAllEv>:
    }
    checkAll();
}

void Timer::checkAll() {
    node*tr = head;
    80002804:	00005517          	auipc	a0,0x5
    80002808:	fac53503          	ld	a0,-84(a0) # 800077b0 <_ZN5Timer4headE>
    while(true){

        if(tr==nullptr)break;
    8000280c:	04050463          	beqz	a0,80002854 <_ZN5Timer8checkAllEv+0x50>
        else{
            if(tr->timeSliceCounter==0){
    80002810:	01053783          	ld	a5,16(a0)
    80002814:	04078263          	beqz	a5,80002858 <_ZN5Timer8checkAllEv+0x54>
                    tr = tr->next;
                    MemoryAllocator::free(temp);
                }
            }
            else{
                tr = tr->next;
    80002818:	00853503          	ld	a0,8(a0)
    8000281c:	ff1ff06f          	j	8000280c <_ZN5Timer8checkAllEv+0x8>
                    head = head->next;
    80002820:	0087b783          	ld	a5,8(a5)
    80002824:	00005717          	auipc	a4,0x5
    80002828:	f8f73623          	sd	a5,-116(a4) # 800077b0 <_ZN5Timer4headE>
                    tr = tr->next;
    8000282c:	00853483          	ld	s1,8(a0)
                    MemoryAllocator::free(temp);
    80002830:	00000097          	auipc	ra,0x0
    80002834:	278080e7          	jalr	632(ra) # 80002aa8 <_ZN15MemoryAllocator4freeEPv>
                    tr = tr->next;
    80002838:	00048513          	mv	a0,s1
    8000283c:	0600006f          	j	8000289c <_ZN5Timer8checkAllEv+0x98>
    printString("-----\nizbacivanje\nScheduler ima: ");
    printInt(Scheduler::len());
    printString("\nTimer ima: ");
    printInt(len());
    printString("\n");*/
}
    80002840:	01813083          	ld	ra,24(sp)
    80002844:	01013403          	ld	s0,16(sp)
    80002848:	00813483          	ld	s1,8(sp)
    8000284c:	02010113          	addi	sp,sp,32
    80002850:	00008067          	ret
    80002854:	00008067          	ret
void Timer::checkAll() {
    80002858:	fe010113          	addi	sp,sp,-32
    8000285c:	00113c23          	sd	ra,24(sp)
    80002860:	00813823          	sd	s0,16(sp)
    80002864:	00913423          	sd	s1,8(sp)
    80002868:	02010413          	addi	s0,sp,32
                if(tr == head){
    8000286c:	00005797          	auipc	a5,0x5
    80002870:	f447b783          	ld	a5,-188(a5) # 800077b0 <_ZN5Timer4headE>
    80002874:	faa786e3          	beq	a5,a0,80002820 <_ZN5Timer8checkAllEv+0x1c>
                        if(temp->next==tr)break;
    80002878:	00078713          	mv	a4,a5
    8000287c:	0087b783          	ld	a5,8(a5)
    80002880:	fea79ce3          	bne	a5,a0,80002878 <_ZN5Timer8checkAllEv+0x74>
                    temp->next = tr->next;
    80002884:	00853783          	ld	a5,8(a0)
    80002888:	00f73423          	sd	a5,8(a4)
                    tr = tr->next;
    8000288c:	00853483          	ld	s1,8(a0)
                    MemoryAllocator::free(temp);
    80002890:	00000097          	auipc	ra,0x0
    80002894:	218080e7          	jalr	536(ra) # 80002aa8 <_ZN15MemoryAllocator4freeEPv>
                    tr = tr->next;
    80002898:	00048513          	mv	a0,s1
        if(tr==nullptr)break;
    8000289c:	fa0502e3          	beqz	a0,80002840 <_ZN5Timer8checkAllEv+0x3c>
            if(tr->timeSliceCounter==0){
    800028a0:	01053783          	ld	a5,16(a0)
    800028a4:	fc0784e3          	beqz	a5,8000286c <_ZN5Timer8checkAllEv+0x68>
                tr = tr->next;
    800028a8:	00853503          	ld	a0,8(a0)
    800028ac:	ff1ff06f          	j	8000289c <_ZN5Timer8checkAllEv+0x98>

00000000800028b0 <_ZN5Timer9updateAllEv>:
void Timer::updateAll() {
    800028b0:	fe010113          	addi	sp,sp,-32
    800028b4:	00113c23          	sd	ra,24(sp)
    800028b8:	00813823          	sd	s0,16(sp)
    800028bc:	00913423          	sd	s1,8(sp)
    800028c0:	02010413          	addi	s0,sp,32
    if(head == nullptr){checkAll();return;}
    800028c4:	00005497          	auipc	s1,0x5
    800028c8:	eec4b483          	ld	s1,-276(s1) # 800077b0 <_ZN5Timer4headE>
    800028cc:	02049063          	bnez	s1,800028ec <_ZN5Timer9updateAllEv+0x3c>
    800028d0:	00000097          	auipc	ra,0x0
    800028d4:	f34080e7          	jalr	-204(ra) # 80002804 <_ZN5Timer8checkAllEv>
    800028d8:	0340006f          	j	8000290c <_ZN5Timer9updateAllEv+0x5c>
            if(temp->timeSliceCounter==0){Scheduler::put(temp->info);}
    800028dc:	0004b503          	ld	a0,0(s1)
    800028e0:	fffff097          	auipc	ra,0xfffff
    800028e4:	09c080e7          	jalr	156(ra) # 8000197c <_ZN9Scheduler3putEP12KernelThread>
            temp = temp->next;
    800028e8:	0084b483          	ld	s1,8(s1)
        if(temp == nullptr){
    800028ec:	00048c63          	beqz	s1,80002904 <_ZN5Timer9updateAllEv+0x54>
            temp->timeSliceCounter--;
    800028f0:	0104b783          	ld	a5,16(s1)
    800028f4:	fff78793          	addi	a5,a5,-1
    800028f8:	00f4b823          	sd	a5,16(s1)
            if(temp->timeSliceCounter==0){Scheduler::put(temp->info);}
    800028fc:	fe0796e3          	bnez	a5,800028e8 <_ZN5Timer9updateAllEv+0x38>
    80002900:	fddff06f          	j	800028dc <_ZN5Timer9updateAllEv+0x2c>
    checkAll();
    80002904:	00000097          	auipc	ra,0x0
    80002908:	f00080e7          	jalr	-256(ra) # 80002804 <_ZN5Timer8checkAllEv>
}
    8000290c:	01813083          	ld	ra,24(sp)
    80002910:	01013403          	ld	s0,16(sp)
    80002914:	00813483          	ld	s1,8(sp)
    80002918:	02010113          	addi	sp,sp,32
    8000291c:	00008067          	ret

0000000080002920 <_ZN15MemoryAllocator18roundToNumOfBlocksEm>:

#include "../h/MemoryAllocator.hpp"

MemoryAllocator::FreeMem *MemoryAllocator::freeMemHead = nullptr;

size_t MemoryAllocator::roundToNumOfBlocks(size_t size) {
    80002920:	ff010113          	addi	sp,sp,-16
    80002924:	00813423          	sd	s0,8(sp)
    80002928:	01010413          	addi	s0,sp,16
    8000292c:	00050793          	mv	a5,a0
    size_t sz = size / MEM_BLOCK_SIZE;
    80002930:	00655513          	srli	a0,a0,0x6
    if (size % MEM_BLOCK_SIZE != 0)
    80002934:	03f7f793          	andi	a5,a5,63
    80002938:	00078463          	beqz	a5,80002940 <_ZN15MemoryAllocator18roundToNumOfBlocksEm+0x20>
        sz++;
    8000293c:	00150513          	addi	a0,a0,1
    return sz;
}
    80002940:	00813403          	ld	s0,8(sp)
    80002944:	01010113          	addi	sp,sp,16
    80002948:	00008067          	ret

000000008000294c <_ZN15MemoryAllocator4initEv>:

void MemoryAllocator::init() {
    8000294c:	ff010113          	addi	sp,sp,-16
    80002950:	00813423          	sd	s0,8(sp)
    80002954:	01010413          	addi	s0,sp,16
    freeMemHead = (FreeMem *) HEAP_START_ADDR;
    80002958:	00005697          	auipc	a3,0x5
    8000295c:	d986b683          	ld	a3,-616(a3) # 800076f0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002960:	0006b783          	ld	a5,0(a3)
    80002964:	00005717          	auipc	a4,0x5
    80002968:	e5470713          	addi	a4,a4,-428 # 800077b8 <_ZN15MemoryAllocator11freeMemHeadE>
    8000296c:	00f73023          	sd	a5,0(a4)
    freeMemHead->next = nullptr;
    80002970:	0007b023          	sd	zero,0(a5)
    freeMemHead->size = (char *) HEAP_END_ADDR - (char *) HEAP_START_ADDR;
    80002974:	00005797          	auipc	a5,0x5
    80002978:	dcc7b783          	ld	a5,-564(a5) # 80007740 <_GLOBAL_OFFSET_TABLE_+0x70>
    8000297c:	0007b783          	ld	a5,0(a5)
    80002980:	0006b683          	ld	a3,0(a3)
    80002984:	00073703          	ld	a4,0(a4)
    80002988:	40d787b3          	sub	a5,a5,a3
    8000298c:	00f73423          	sd	a5,8(a4)
}
    80002990:	00813403          	ld	s0,8(sp)
    80002994:	01010113          	addi	sp,sp,16
    80002998:	00008067          	ret

000000008000299c <_ZN15MemoryAllocator6mallocEm>:

void *MemoryAllocator::malloc(size_t sz) {
    8000299c:	ff010113          	addi	sp,sp,-16
    800029a0:	00813423          	sd	s0,8(sp)
    800029a4:	01010413          	addi	s0,sp,16
    // Try to find an existing free block in the list (first fit):
   // size_t size = roundToNumOfBlocks(sz);
    size_t size = sz * MEM_BLOCK_SIZE;
    800029a8:	00651713          	slli	a4,a0,0x6
    FreeMem *blk = freeMemHead, *prev = nullptr;
    800029ac:	00005517          	auipc	a0,0x5
    800029b0:	e0c53503          	ld	a0,-500(a0) # 800077b8 <_ZN15MemoryAllocator11freeMemHeadE>
    800029b4:	00000693          	li	a3,0
    for (; blk != nullptr; prev = blk, blk = blk->next)
    800029b8:	00050c63          	beqz	a0,800029d0 <_ZN15MemoryAllocator6mallocEm+0x34>
        if (blk->size >= size) break;
    800029bc:	00853783          	ld	a5,8(a0)
    800029c0:	00e7f863          	bgeu	a5,a4,800029d0 <_ZN15MemoryAllocator6mallocEm+0x34>
    for (; blk != nullptr; prev = blk, blk = blk->next)
    800029c4:	00050693          	mv	a3,a0
    800029c8:	00053503          	ld	a0,0(a0)
    800029cc:	fedff06f          	j	800029b8 <_ZN15MemoryAllocator6mallocEm+0x1c>
    // If not found, allocate a new memory segment and add it to the list:
    if (blk == nullptr) {
    800029d0:	04050063          	beqz	a0,80002a10 <_ZN15MemoryAllocator6mallocEm+0x74>
        return nullptr;
    }
    // Allocate the requested block:
    size_t remainingSize = blk->size - size;
    800029d4:	00853783          	ld	a5,8(a0)
    800029d8:	40e787b3          	sub	a5,a5,a4
    if (remainingSize >= sizeof(FreeMem) + MEM_BLOCK_SIZE) {
    800029dc:	04f00613          	li	a2,79
    800029e0:	04f67463          	bgeu	a2,a5,80002a28 <_ZN15MemoryAllocator6mallocEm+0x8c>
        // A fragment remains
        blk->size = size;
    800029e4:	00e53423          	sd	a4,8(a0)
        size_t offset = sizeof(FreeMem) + size;
    800029e8:	01070713          	addi	a4,a4,16
        FreeMem *newBlk = (FreeMem *) ((char *) blk + offset);
    800029ec:	00e50733          	add	a4,a0,a4
        if (prev) prev->next = newBlk;
    800029f0:	02068663          	beqz	a3,80002a1c <_ZN15MemoryAllocator6mallocEm+0x80>
    800029f4:	00e6b023          	sd	a4,0(a3)
        else freeMemHead = newBlk;
        newBlk->next = blk->next;
    800029f8:	00053683          	ld	a3,0(a0)
    800029fc:	00d73023          	sd	a3,0(a4)
        newBlk->size = remainingSize - sizeof(FreeMem);
    80002a00:	ff078793          	addi	a5,a5,-16
    80002a04:	00f73423          	sd	a5,8(a4)
    } else {
        // No remaining fragment, allocate the entire block
        if (prev) prev->next = blk->next;
        else freeMemHead = blk->next;
    }
    blk->next = nullptr;
    80002a08:	00053023          	sd	zero,0(a0)
    return (char *) blk + sizeof(FreeMem);
    80002a0c:	01050513          	addi	a0,a0,16
}
    80002a10:	00813403          	ld	s0,8(sp)
    80002a14:	01010113          	addi	sp,sp,16
    80002a18:	00008067          	ret
        else freeMemHead = newBlk;
    80002a1c:	00005697          	auipc	a3,0x5
    80002a20:	d8e6be23          	sd	a4,-612(a3) # 800077b8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002a24:	fd5ff06f          	j	800029f8 <_ZN15MemoryAllocator6mallocEm+0x5c>
        if (prev) prev->next = blk->next;
    80002a28:	00068863          	beqz	a3,80002a38 <_ZN15MemoryAllocator6mallocEm+0x9c>
    80002a2c:	00053783          	ld	a5,0(a0)
    80002a30:	00f6b023          	sd	a5,0(a3)
    80002a34:	fd5ff06f          	j	80002a08 <_ZN15MemoryAllocator6mallocEm+0x6c>
        else freeMemHead = blk->next;
    80002a38:	00053783          	ld	a5,0(a0)
    80002a3c:	00005717          	auipc	a4,0x5
    80002a40:	d6f73e23          	sd	a5,-644(a4) # 800077b8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002a44:	fc5ff06f          	j	80002a08 <_ZN15MemoryAllocator6mallocEm+0x6c>

0000000080002a48 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE>:

int MemoryAllocator::tryToJoin(FreeMem *cur) {
    80002a48:	ff010113          	addi	sp,sp,-16
    80002a4c:	00813423          	sd	s0,8(sp)
    80002a50:	01010413          	addi	s0,sp,16
    if (!cur) return 0;
    80002a54:	04050263          	beqz	a0,80002a98 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x50>
    if (cur->next && (char *) cur + cur->size == (char *) (cur->next)) {
    80002a58:	00053783          	ld	a5,0(a0)
    80002a5c:	04078263          	beqz	a5,80002aa0 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x58>
    80002a60:	00853703          	ld	a4,8(a0)
    80002a64:	00e506b3          	add	a3,a0,a4
    80002a68:	00d78a63          	beq	a5,a3,80002a7c <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x34>
        // Remove the cur->next segment:
        cur->size += cur->next->size;
        cur->next = cur->next->next;
        return 1;
    } else
        return 0;
    80002a6c:	00000513          	li	a0,0
}
    80002a70:	00813403          	ld	s0,8(sp)
    80002a74:	01010113          	addi	sp,sp,16
    80002a78:	00008067          	ret
        cur->size += cur->next->size;
    80002a7c:	0087b683          	ld	a3,8(a5)
    80002a80:	00d70733          	add	a4,a4,a3
    80002a84:	00e53423          	sd	a4,8(a0)
        cur->next = cur->next->next;
    80002a88:	0007b783          	ld	a5,0(a5)
    80002a8c:	00f53023          	sd	a5,0(a0)
        return 1;
    80002a90:	00100513          	li	a0,1
    80002a94:	fddff06f          	j	80002a70 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x28>
    if (!cur) return 0;
    80002a98:	00000513          	li	a0,0
    80002a9c:	fd5ff06f          	j	80002a70 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x28>
        return 0;
    80002aa0:	00000513          	li	a0,0
    80002aa4:	fcdff06f          	j	80002a70 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE+0x28>

0000000080002aa8 <_ZN15MemoryAllocator4freeEPv>:

int MemoryAllocator::free(void *address) {
    80002aa8:	fe010113          	addi	sp,sp,-32
    80002aac:	00113c23          	sd	ra,24(sp)
    80002ab0:	00813823          	sd	s0,16(sp)
    80002ab4:	00913423          	sd	s1,8(sp)
    80002ab8:	02010413          	addi	s0,sp,32
    80002abc:	00050713          	mv	a4,a0
    FreeMem *header = (FreeMem *) ((char *) address - sizeof(FreeMem));
    80002ac0:	ff050513          	addi	a0,a0,-16
    FreeMem *curr;
    if (!freeMemHead || header < freeMemHead)
    80002ac4:	00005697          	auipc	a3,0x5
    80002ac8:	cf46b683          	ld	a3,-780(a3) # 800077b8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002acc:	02068063          	beqz	a3,80002aec <_ZN15MemoryAllocator4freeEPv+0x44>
    80002ad0:	02d56263          	bltu	a0,a3,80002af4 <_ZN15MemoryAllocator4freeEPv+0x4c>
        curr = 0;
    else
        for (curr = freeMemHead; curr->next != 0 && header > curr->next; curr = curr->next);
    80002ad4:	00068793          	mv	a5,a3
    80002ad8:	00078493          	mv	s1,a5
    80002adc:	0007b783          	ld	a5,0(a5)
    80002ae0:	00078c63          	beqz	a5,80002af8 <_ZN15MemoryAllocator4freeEPv+0x50>
    80002ae4:	fea7eae3          	bltu	a5,a0,80002ad8 <_ZN15MemoryAllocator4freeEPv+0x30>
    80002ae8:	0100006f          	j	80002af8 <_ZN15MemoryAllocator4freeEPv+0x50>
        curr = 0;
    80002aec:	00068493          	mv	s1,a3
    80002af0:	0080006f          	j	80002af8 <_ZN15MemoryAllocator4freeEPv+0x50>
    80002af4:	00000493          	li	s1,0
    FreeMem *newSeg = header;
    newSeg->size = header->size;
    if (curr) newSeg->next = curr->next;
    80002af8:	04048063          	beqz	s1,80002b38 <_ZN15MemoryAllocator4freeEPv+0x90>
    80002afc:	0004b783          	ld	a5,0(s1)
    80002b00:	fef73823          	sd	a5,-16(a4)
    else newSeg->next = freeMemHead;
    if (curr) curr->next = newSeg;
    80002b04:	02048e63          	beqz	s1,80002b40 <_ZN15MemoryAllocator4freeEPv+0x98>
    80002b08:	00a4b023          	sd	a0,0(s1)
    else freeMemHead = newSeg;
    tryToJoin(newSeg);
    80002b0c:	00000097          	auipc	ra,0x0
    80002b10:	f3c080e7          	jalr	-196(ra) # 80002a48 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE>
    tryToJoin(curr);
    80002b14:	00048513          	mv	a0,s1
    80002b18:	00000097          	auipc	ra,0x0
    80002b1c:	f30080e7          	jalr	-208(ra) # 80002a48 <_ZN15MemoryAllocator9tryToJoinEPNS_7FreeMemE>
    return 0;
}
    80002b20:	00000513          	li	a0,0
    80002b24:	01813083          	ld	ra,24(sp)
    80002b28:	01013403          	ld	s0,16(sp)
    80002b2c:	00813483          	ld	s1,8(sp)
    80002b30:	02010113          	addi	sp,sp,32
    80002b34:	00008067          	ret
    else newSeg->next = freeMemHead;
    80002b38:	fed73823          	sd	a3,-16(a4)
    80002b3c:	fc9ff06f          	j	80002b04 <_ZN15MemoryAllocator4freeEPv+0x5c>
    else freeMemHead = newSeg;
    80002b40:	00005797          	auipc	a5,0x5
    80002b44:	c6a7bc23          	sd	a0,-904(a5) # 800077b8 <_ZN15MemoryAllocator11freeMemHeadE>
    80002b48:	fc5ff06f          	j	80002b0c <_ZN15MemoryAllocator4freeEPv+0x64>

0000000080002b4c <_ZN12KernelThread15createCoroutineEPPS_PFvPvEPmS2_m>:
KernelThread *KernelThread::idleThread = nullptr;
uint64 KernelThread::timeSliceCounter=0;
KernelThread *KernelThread::putThread = nullptr;

KernelThread *KernelThread::mainThread = nullptr;
int KernelThread::createCoroutine(KernelThread**handle,KernelThread::Body bod, uint64*s, void* args,uint64 flag) {
    80002b4c:	fc010113          	addi	sp,sp,-64
    80002b50:	02113c23          	sd	ra,56(sp)
    80002b54:	02813823          	sd	s0,48(sp)
    80002b58:	02913423          	sd	s1,40(sp)
    80002b5c:	03213023          	sd	s2,32(sp)
    80002b60:	01313c23          	sd	s3,24(sp)
    80002b64:	01413823          	sd	s4,16(sp)
    80002b68:	01513423          	sd	s5,8(sp)
    80002b6c:	01613023          	sd	s6,0(sp)
    80002b70:	04010413          	addi	s0,sp,64
    80002b74:	00050a93          	mv	s5,a0
    80002b78:	00058a13          	mv	s4,a1
    80002b7c:	00060993          	mv	s3,a2
    80002b80:	00068913          	mv	s2,a3
    bool f;
    if(flag==0)f=false;
    80002b84:	0a071463          	bnez	a4,80002c2c <_ZN12KernelThread15createCoroutineEPPS_PFvPvEPmS2_m+0xe0>
    80002b88:	00000b13          	li	s6,0
    else f = true;
    size_t size = sizeof(KernelThread);
    size_t sz = MemoryAllocator::roundToNumOfBlocks(size);
    80002b8c:	04000513          	li	a0,64
    80002b90:	00000097          	auipc	ra,0x0
    80002b94:	d90080e7          	jalr	-624(ra) # 80002920 <_ZN15MemoryAllocator18roundToNumOfBlocksEm>

    KernelThread* tr;

    tr = (KernelThread*)MemoryAllocator::malloc(sz);
    80002b98:	00000097          	auipc	ra,0x0
    80002b9c:	e04080e7          	jalr	-508(ra) # 8000299c <_ZN15MemoryAllocator6mallocEm>
    80002ba0:	00050493          	mv	s1,a0
    if(!tr){
    80002ba4:	08050863          	beqz	a0,80002c34 <_ZN12KernelThread15createCoroutineEPPS_PFvPvEPmS2_m+0xe8>
        if(s)MemoryAllocator::free(s);
        return -1;
    }

    tr->body = bod;
    80002ba8:	01453423          	sd	s4,8(a0)
    tr->argument = args;
    80002bac:	03253023          	sd	s2,32(a0)
    tr->timeSlice = DEFAULT_TIME_SLICE;
    80002bb0:	00200793          	li	a5,2
    80002bb4:	00f53023          	sd	a5,0(a0)
    tr->finished = false;
    80002bb8:	00050c23          	sb	zero,24(a0)
    tr->retVal=0;
    80002bbc:	02052623          	sw	zero,44(a0)
    if(tr->body != nullptr){
    80002bc0:	080a0a63          	beqz	s4,80002c54 <_ZN12KernelThread15createCoroutineEPPS_PFvPvEPmS2_m+0x108>
        tr->context.ra=(uint64)&threadWrapper;
    80002bc4:	00000797          	auipc	a5,0x0
    80002bc8:	30c78793          	addi	a5,a5,780 # 80002ed0 <_ZN12KernelThread13threadWrapperEv>
    80002bcc:	02f53823          	sd	a5,48(a0)
        tr->stack = s;
    80002bd0:	01353823          	sd	s3,16(a0)
        if(f)tr->started=true;
    80002bd4:	060b0c63          	beqz	s6,80002c4c <_ZN12KernelThread15createCoroutineEPPS_PFvPvEPmS2_m+0x100>
    80002bd8:	00100793          	li	a5,1
    80002bdc:	02f50423          	sb	a5,40(a0)
        mainThread = tr;
        tr->context.ra = 0;
        tr->stack = nullptr;
        tr->started=true;
    }
    if (tr->stack != nullptr){
    80002be0:	0104b783          	ld	a5,16(s1)
    80002be4:	08078663          	beqz	a5,80002c70 <_ZN12KernelThread15createCoroutineEPPS_PFvPvEPmS2_m+0x124>
        tr->context.sp=(uint64)&tr->stack[DEFAULT_STACK_SIZE];
    80002be8:	00008737          	lui	a4,0x8
    80002bec:	00e787b3          	add	a5,a5,a4
    80002bf0:	02f4bc23          	sd	a5,56(s1)
    }
    else{
        tr->context.sp=0;
    }
    if (tr->body != nullptr && f) { Scheduler::put(tr); }
    80002bf4:	000a0463          	beqz	s4,80002bfc <_ZN12KernelThread15createCoroutineEPPS_PFvPvEPmS2_m+0xb0>
    80002bf8:	080b1063          	bnez	s6,80002c78 <_ZN12KernelThread15createCoroutineEPPS_PFvPvEPmS2_m+0x12c>
    *handle = tr;
    80002bfc:	009ab023          	sd	s1,0(s5)
    return 0;
    80002c00:	00000513          	li	a0,0
}
    80002c04:	03813083          	ld	ra,56(sp)
    80002c08:	03013403          	ld	s0,48(sp)
    80002c0c:	02813483          	ld	s1,40(sp)
    80002c10:	02013903          	ld	s2,32(sp)
    80002c14:	01813983          	ld	s3,24(sp)
    80002c18:	01013a03          	ld	s4,16(sp)
    80002c1c:	00813a83          	ld	s5,8(sp)
    80002c20:	00013b03          	ld	s6,0(sp)
    80002c24:	04010113          	addi	sp,sp,64
    80002c28:	00008067          	ret
    else f = true;
    80002c2c:	00100b13          	li	s6,1
    80002c30:	f5dff06f          	j	80002b8c <_ZN12KernelThread15createCoroutineEPPS_PFvPvEPmS2_m+0x40>
        if(s)MemoryAllocator::free(s);
    80002c34:	00098863          	beqz	s3,80002c44 <_ZN12KernelThread15createCoroutineEPPS_PFvPvEPmS2_m+0xf8>
    80002c38:	00098513          	mv	a0,s3
    80002c3c:	00000097          	auipc	ra,0x0
    80002c40:	e6c080e7          	jalr	-404(ra) # 80002aa8 <_ZN15MemoryAllocator4freeEPv>
        return -1;
    80002c44:	fff00513          	li	a0,-1
    80002c48:	fbdff06f          	j	80002c04 <_ZN12KernelThread15createCoroutineEPPS_PFvPvEPmS2_m+0xb8>
        else tr->started=false;
    80002c4c:	02050423          	sb	zero,40(a0)
    80002c50:	f91ff06f          	j	80002be0 <_ZN12KernelThread15createCoroutineEPPS_PFvPvEPmS2_m+0x94>
        mainThread = tr;
    80002c54:	00005797          	auipc	a5,0x5
    80002c58:	b6a7b623          	sd	a0,-1172(a5) # 800077c0 <_ZN12KernelThread10mainThreadE>
        tr->context.ra = 0;
    80002c5c:	02053823          	sd	zero,48(a0)
        tr->stack = nullptr;
    80002c60:	00053823          	sd	zero,16(a0)
        tr->started=true;
    80002c64:	00100793          	li	a5,1
    80002c68:	02f50423          	sb	a5,40(a0)
    80002c6c:	f75ff06f          	j	80002be0 <_ZN12KernelThread15createCoroutineEPPS_PFvPvEPmS2_m+0x94>
        tr->context.sp=0;
    80002c70:	0204bc23          	sd	zero,56(s1)
    80002c74:	f81ff06f          	j	80002bf4 <_ZN12KernelThread15createCoroutineEPPS_PFvPvEPmS2_m+0xa8>
    if (tr->body != nullptr && f) { Scheduler::put(tr); }
    80002c78:	00048513          	mv	a0,s1
    80002c7c:	fffff097          	auipc	ra,0xfffff
    80002c80:	d00080e7          	jalr	-768(ra) # 8000197c <_ZN9Scheduler3putEP12KernelThread>
    80002c84:	f79ff06f          	j	80002bfc <_ZN12KernelThread15createCoroutineEPPS_PFvPvEPmS2_m+0xb0>

0000000080002c88 <_ZNK12KernelThread10isFinishedEv>:


bool KernelThread::isFinished() const {
    80002c88:	ff010113          	addi	sp,sp,-16
    80002c8c:	00813423          	sd	s0,8(sp)
    80002c90:	01010413          	addi	s0,sp,16
    return finished;
}
    80002c94:	01854503          	lbu	a0,24(a0)
    80002c98:	00813403          	ld	s0,8(sp)
    80002c9c:	01010113          	addi	sp,sp,16
    80002ca0:	00008067          	ret

0000000080002ca4 <_ZN12KernelThread11setFinishedEb>:

void KernelThread::setFinished(bool value) {
    80002ca4:	ff010113          	addi	sp,sp,-16
    80002ca8:	00813423          	sd	s0,8(sp)
    80002cac:	01010413          	addi	s0,sp,16
    finished = value;
    80002cb0:	00b50c23          	sb	a1,24(a0)
}
    80002cb4:	00813403          	ld	s0,8(sp)
    80002cb8:	01010113          	addi	sp,sp,16
    80002cbc:	00008067          	ret

0000000080002cc0 <_ZN12KernelThread5yieldEv>:

void KernelThread::yield() {
    80002cc0:	ff010113          	addi	sp,sp,-16
    80002cc4:	00813423          	sd	s0,8(sp)
    80002cc8:	01010413          	addi	s0,sp,16


    __asm__ volatile("li a0, 0x13");
    80002ccc:	01300513          	li	a0,19
    __asm__ volatile("ecall");
    80002cd0:	00000073          	ecall
 //   KernelThread::pushRegisters();

   // KernelThread::dispatch();

    //KernelThread::popRegisters();
}
    80002cd4:	00813403          	ld	s0,8(sp)
    80002cd8:	01010113          	addi	sp,sp,16
    80002cdc:	00008067          	ret

0000000080002ce0 <_ZN12KernelThread8dispatchEv>:

void KernelThread::dispatch(){
    80002ce0:	fe010113          	addi	sp,sp,-32
    80002ce4:	00113c23          	sd	ra,24(sp)
    80002ce8:	00813823          	sd	s0,16(sp)
    80002cec:	00913423          	sd	s1,8(sp)
    80002cf0:	01213023          	sd	s2,0(sp)
    80002cf4:	02010413          	addi	s0,sp,32
    KernelThread *old = running;
    80002cf8:	00005917          	auipc	s2,0x5
    80002cfc:	ac890913          	addi	s2,s2,-1336 # 800077c0 <_ZN12KernelThread10mainThreadE>
    80002d00:	00893483          	ld	s1,8(s2)

    running = Scheduler::get();
    80002d04:	fffff097          	auipc	ra,0xfffff
    80002d08:	d10080e7          	jalr	-752(ra) # 80001a14 <_ZN9Scheduler3getEv>
    80002d0c:	00a93423          	sd	a0,8(s2)
    if (old!=idleThread && !old->isFinished()) { Scheduler::put(old); }
    80002d10:	01093783          	ld	a5,16(s2)
    80002d14:	00978a63          	beq	a5,s1,80002d28 <_ZN12KernelThread8dispatchEv+0x48>
    80002d18:	00048513          	mv	a0,s1
    80002d1c:	00000097          	auipc	ra,0x0
    80002d20:	f6c080e7          	jalr	-148(ra) # 80002c88 <_ZNK12KernelThread10isFinishedEv>
    80002d24:	06050063          	beqz	a0,80002d84 <_ZN12KernelThread8dispatchEv+0xa4>


    if(old->isFinished()){
    80002d28:	00048513          	mv	a0,s1
    80002d2c:	00000097          	auipc	ra,0x0
    80002d30:	f5c080e7          	jalr	-164(ra) # 80002c88 <_ZNK12KernelThread10isFinishedEv>
    80002d34:	02050063          	beqz	a0,80002d54 <_ZN12KernelThread8dispatchEv+0x74>
        if(old->stack)MemoryAllocator::free(old->stack);
    80002d38:	0104b503          	ld	a0,16(s1)
    80002d3c:	00050663          	beqz	a0,80002d48 <_ZN12KernelThread8dispatchEv+0x68>
    80002d40:	00000097          	auipc	ra,0x0
    80002d44:	d68080e7          	jalr	-664(ra) # 80002aa8 <_ZN15MemoryAllocator4freeEPv>
        MemoryAllocator::free(old);
    80002d48:	00048513          	mv	a0,s1
    80002d4c:	00000097          	auipc	ra,0x0
    80002d50:	d5c080e7          	jalr	-676(ra) # 80002aa8 <_ZN15MemoryAllocator4freeEPv>
    }

    KernelThread::contextSwitch(&old->context, &running->context);
    80002d54:	00005597          	auipc	a1,0x5
    80002d58:	a745b583          	ld	a1,-1420(a1) # 800077c8 <_ZN12KernelThread7runningE>
    80002d5c:	03058593          	addi	a1,a1,48
    80002d60:	03048513          	addi	a0,s1,48
    80002d64:	ffffe097          	auipc	ra,0xffffe
    80002d68:	4b4080e7          	jalr	1204(ra) # 80001218 <_ZN12KernelThread13contextSwitchEPNS_7ContextES1_>

    //old->finished=false;

}
    80002d6c:	01813083          	ld	ra,24(sp)
    80002d70:	01013403          	ld	s0,16(sp)
    80002d74:	00813483          	ld	s1,8(sp)
    80002d78:	00013903          	ld	s2,0(sp)
    80002d7c:	02010113          	addi	sp,sp,32
    80002d80:	00008067          	ret
    if (old!=idleThread && !old->isFinished()) { Scheduler::put(old); }
    80002d84:	00048513          	mv	a0,s1
    80002d88:	fffff097          	auipc	ra,0xfffff
    80002d8c:	bf4080e7          	jalr	-1036(ra) # 8000197c <_ZN9Scheduler3putEP12KernelThread>
    80002d90:	f99ff06f          	j	80002d28 <_ZN12KernelThread8dispatchEv+0x48>

0000000080002d94 <_ZN12KernelThread19dispatchNoSchedulerEv>:

void KernelThread::dispatchNoScheduler(){
    80002d94:	fe010113          	addi	sp,sp,-32
    80002d98:	00113c23          	sd	ra,24(sp)
    80002d9c:	00813823          	sd	s0,16(sp)
    80002da0:	00913423          	sd	s1,8(sp)
    80002da4:	01213023          	sd	s2,0(sp)
    80002da8:	02010413          	addi	s0,sp,32
    KernelThread::pushRegisters();
    80002dac:	ffffe097          	auipc	ra,0xffffe
    80002db0:	374080e7          	jalr	884(ra) # 80001120 <_ZN12KernelThread13pushRegistersEv>
    KernelThread *old = running;
    80002db4:	00005497          	auipc	s1,0x5
    80002db8:	a0c48493          	addi	s1,s1,-1524 # 800077c0 <_ZN12KernelThread10mainThreadE>
    80002dbc:	0084b903          	ld	s2,8(s1)
    running = Scheduler::get();
    80002dc0:	fffff097          	auipc	ra,0xfffff
    80002dc4:	c54080e7          	jalr	-940(ra) # 80001a14 <_ZN9Scheduler3getEv>
    80002dc8:	00a4b423          	sd	a0,8(s1)
    KernelThread::contextSwitch(&old->context, &running->context);
    80002dcc:	03050593          	addi	a1,a0,48
    80002dd0:	03090513          	addi	a0,s2,48
    80002dd4:	ffffe097          	auipc	ra,0xffffe
    80002dd8:	444080e7          	jalr	1092(ra) # 80001218 <_ZN12KernelThread13contextSwitchEPNS_7ContextES1_>
    if(old->isFinished()){
        if(old->stack)MemoryAllocator::free(old->stack);
        MemoryAllocator::free(old);
    }
*/
    KernelThread::popRegisters();
    80002ddc:	ffffe097          	auipc	ra,0xffffe
    80002de0:	3c0080e7          	jalr	960(ra) # 8000119c <_ZN12KernelThread12popRegistersEv>
}
    80002de4:	01813083          	ld	ra,24(sp)
    80002de8:	01013403          	ld	s0,16(sp)
    80002dec:	00813483          	ld	s1,8(sp)
    80002df0:	00013903          	ld	s2,0(sp)
    80002df4:	02010113          	addi	sp,sp,32
    80002df8:	00008067          	ret

0000000080002dfc <_ZN12KernelThread8initIdleEv>:
    //__asm__ volatile("li a0, 0x13");
    //__asm__ volatile("ecall");
    //ovo umesto yield
}

void KernelThread::initIdle() {
    80002dfc:	fe010113          	addi	sp,sp,-32
    80002e00:	00113c23          	sd	ra,24(sp)
    80002e04:	00813823          	sd	s0,16(sp)
    80002e08:	00913423          	sd	s1,8(sp)
    80002e0c:	01213023          	sd	s2,0(sp)
    80002e10:	02010413          	addi	s0,sp,32
    size_t size = sizeof(KernelThread);
    size_t sz = MemoryAllocator::roundToNumOfBlocks(size);
    80002e14:	04000513          	li	a0,64
    80002e18:	00000097          	auipc	ra,0x0
    80002e1c:	b08080e7          	jalr	-1272(ra) # 80002920 <_ZN15MemoryAllocator18roundToNumOfBlocksEm>

    idleThread = (KernelThread*)MemoryAllocator::malloc(sz);
    80002e20:	00000097          	auipc	ra,0x0
    80002e24:	b7c080e7          	jalr	-1156(ra) # 8000299c <_ZN15MemoryAllocator6mallocEm>
    80002e28:	00005497          	auipc	s1,0x5
    80002e2c:	99848493          	addi	s1,s1,-1640 # 800077c0 <_ZN12KernelThread10mainThreadE>
    80002e30:	00a4b823          	sd	a0,16(s1)
    size = DEFAULT_STACK_SIZE;
    sz = MemoryAllocator::roundToNumOfBlocks(size);
    80002e34:	00001537          	lui	a0,0x1
    80002e38:	00000097          	auipc	ra,0x0
    80002e3c:	ae8080e7          	jalr	-1304(ra) # 80002920 <_ZN15MemoryAllocator18roundToNumOfBlocksEm>

    idleThread->stack = (uint64*)MemoryAllocator::malloc(sz);
    80002e40:	0104b903          	ld	s2,16(s1)
    80002e44:	00000097          	auipc	ra,0x0
    80002e48:	b58080e7          	jalr	-1192(ra) # 8000299c <_ZN15MemoryAllocator6mallocEm>
    80002e4c:	00a93823          	sd	a0,16(s2)
    idleThread->body = nullptr;
    80002e50:	0104b783          	ld	a5,16(s1)
    80002e54:	0007b423          	sd	zero,8(a5)
    idleThread->argument= nullptr;
    80002e58:	0207b023          	sd	zero,32(a5)
    idleThread->context.sp = (uint64)&idleThread->stack[DEFAULT_STACK_SIZE];
    80002e5c:	0107b703          	ld	a4,16(a5)
    80002e60:	000086b7          	lui	a3,0x8
    80002e64:	00d70733          	add	a4,a4,a3
    80002e68:	02e7bc23          	sd	a4,56(a5)
    idleThread->context.ra = (uint64)&idleFunction;
    80002e6c:	00005717          	auipc	a4,0x5
    80002e70:	89c73703          	ld	a4,-1892(a4) # 80007708 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002e74:	02e7b823          	sd	a4,48(a5)
    idleThread->retVal=0;
    80002e78:	0207a623          	sw	zero,44(a5)
    idleThread->finished=false;
    80002e7c:	00078c23          	sb	zero,24(a5)
    idleThread->timeSlice=2;
    80002e80:	00200713          	li	a4,2
    80002e84:	00e7b023          	sd	a4,0(a5)
    idleThread->started=true;
    80002e88:	0104b783          	ld	a5,16(s1)
    80002e8c:	00100713          	li	a4,1
    80002e90:	02e78423          	sb	a4,40(a5)
}
    80002e94:	01813083          	ld	ra,24(sp)
    80002e98:	01013403          	ld	s0,16(sp)
    80002e9c:	00813483          	ld	s1,8(sp)
    80002ea0:	00013903          	ld	s2,0(sp)
    80002ea4:	02010113          	addi	sp,sp,32
    80002ea8:	00008067          	ret

0000000080002eac <_ZN12KernelThread10popSppSpieEv>:



void KernelThread::popSppSpie()
{
    80002eac:	ff010113          	addi	sp,sp,-16
    80002eb0:	00813423          	sd	s0,8(sp)
    80002eb4:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002eb8:	14109073          	csrw	sepc,ra
    __asm__ volatile ("csrc sip, 0x02");
    80002ebc:	14417073          	csrci	sip,2
    __asm__ volatile ("sret");
    80002ec0:	10200073          	sret
}
    80002ec4:	00813403          	ld	s0,8(sp)
    80002ec8:	01010113          	addi	sp,sp,16
    80002ecc:	00008067          	ret

0000000080002ed0 <_ZN12KernelThread13threadWrapperEv>:
void KernelThread::threadWrapper() {
    80002ed0:	fe010113          	addi	sp,sp,-32
    80002ed4:	00113c23          	sd	ra,24(sp)
    80002ed8:	00813823          	sd	s0,16(sp)
    80002edc:	00913423          	sd	s1,8(sp)
    80002ee0:	02010413          	addi	s0,sp,32
    popSppSpie();
    80002ee4:	00000097          	auipc	ra,0x0
    80002ee8:	fc8080e7          	jalr	-56(ra) # 80002eac <_ZN12KernelThread10popSppSpieEv>
    KernelThread::running->body(KernelThread::running->argument);
    80002eec:	00005497          	auipc	s1,0x5
    80002ef0:	8d448493          	addi	s1,s1,-1836 # 800077c0 <_ZN12KernelThread10mainThreadE>
    80002ef4:	0084b783          	ld	a5,8(s1)
    80002ef8:	0087b703          	ld	a4,8(a5)
    80002efc:	0207b503          	ld	a0,32(a5)
    80002f00:	000700e7          	jalr	a4
    KernelThread::running->setFinished(true);
    80002f04:	00100593          	li	a1,1
    80002f08:	0084b503          	ld	a0,8(s1)
    80002f0c:	00000097          	auipc	ra,0x0
    80002f10:	d98080e7          	jalr	-616(ra) # 80002ca4 <_ZN12KernelThread11setFinishedEb>
    KernelThread::yield();
    80002f14:	00000097          	auipc	ra,0x0
    80002f18:	dac080e7          	jalr	-596(ra) # 80002cc0 <_ZN12KernelThread5yieldEv>
}
    80002f1c:	01813083          	ld	ra,24(sp)
    80002f20:	01013403          	ld	s0,16(sp)
    80002f24:	00813483          	ld	s1,8(sp)
    80002f28:	02010113          	addi	sp,sp,32
    80002f2c:	00008067          	ret

0000000080002f30 <_ZNK12KernelThread12getTimeSliceEv>:

uint64 KernelThread::getTimeSlice() const {
    80002f30:	ff010113          	addi	sp,sp,-16
    80002f34:	00813423          	sd	s0,8(sp)
    80002f38:	01010413          	addi	s0,sp,16
    return timeSlice;
}
    80002f3c:	00053503          	ld	a0,0(a0) # 1000 <_entry-0x7ffff000>
    80002f40:	00813403          	ld	s0,8(sp)
    80002f44:	01010113          	addi	sp,sp,16
    80002f48:	00008067          	ret

0000000080002f4c <_ZN12KernelThread7initPutEv>:


void KernelThread::initPut() {
    80002f4c:	fe010113          	addi	sp,sp,-32
    80002f50:	00113c23          	sd	ra,24(sp)
    80002f54:	00813823          	sd	s0,16(sp)
    80002f58:	00913423          	sd	s1,8(sp)
    80002f5c:	01213023          	sd	s2,0(sp)
    80002f60:	02010413          	addi	s0,sp,32
    size_t size = sizeof(KernelThread);
    size_t sz = MemoryAllocator::roundToNumOfBlocks(size);
    80002f64:	04000513          	li	a0,64
    80002f68:	00000097          	auipc	ra,0x0
    80002f6c:	9b8080e7          	jalr	-1608(ra) # 80002920 <_ZN15MemoryAllocator18roundToNumOfBlocksEm>

    putThread = (KernelThread*)MemoryAllocator::malloc(sz);
    80002f70:	00000097          	auipc	ra,0x0
    80002f74:	a2c080e7          	jalr	-1492(ra) # 8000299c <_ZN15MemoryAllocator6mallocEm>
    80002f78:	00005497          	auipc	s1,0x5
    80002f7c:	84848493          	addi	s1,s1,-1976 # 800077c0 <_ZN12KernelThread10mainThreadE>
    80002f80:	00a4bc23          	sd	a0,24(s1)
    size = DEFAULT_STACK_SIZE;
    sz = MemoryAllocator::roundToNumOfBlocks(size);
    80002f84:	00001537          	lui	a0,0x1
    80002f88:	00000097          	auipc	ra,0x0
    80002f8c:	998080e7          	jalr	-1640(ra) # 80002920 <_ZN15MemoryAllocator18roundToNumOfBlocksEm>

    putThread->stack = (uint64*)MemoryAllocator::malloc(sz);
    80002f90:	0184b903          	ld	s2,24(s1)
    80002f94:	00000097          	auipc	ra,0x0
    80002f98:	a08080e7          	jalr	-1528(ra) # 8000299c <_ZN15MemoryAllocator6mallocEm>
    80002f9c:	00a93823          	sd	a0,16(s2)
    putThread->body = nullptr;
    80002fa0:	0184b783          	ld	a5,24(s1)
    80002fa4:	0007b423          	sd	zero,8(a5)
    putThread->argument= nullptr;
    80002fa8:	0207b023          	sd	zero,32(a5)
    putThread->context.sp = (uint64)&putThread->stack[DEFAULT_STACK_SIZE];
    80002fac:	0107b703          	ld	a4,16(a5)
    80002fb0:	000086b7          	lui	a3,0x8
    80002fb4:	00d70733          	add	a4,a4,a3
    80002fb8:	02e7bc23          	sd	a4,56(a5)
    putThread->context.ra = (uint64)&putFunction;
    80002fbc:	00004717          	auipc	a4,0x4
    80002fc0:	77c73703          	ld	a4,1916(a4) # 80007738 <_GLOBAL_OFFSET_TABLE_+0x68>
    80002fc4:	02e7b823          	sd	a4,48(a5)
    putThread->timeSlice=2;
    80002fc8:	00200713          	li	a4,2
    80002fcc:	00e7b023          	sd	a4,0(a5)
    putThread->retVal=0;
    80002fd0:	0184b503          	ld	a0,24(s1)
    80002fd4:	02052623          	sw	zero,44(a0) # 102c <_entry-0x7fffefd4>
    putThread->finished=false;
    80002fd8:	00050c23          	sb	zero,24(a0)
    putThread->started = true;
    80002fdc:	00100793          	li	a5,1
    80002fe0:	02f50423          	sb	a5,40(a0)
    Scheduler::put(putThread);
    80002fe4:	fffff097          	auipc	ra,0xfffff
    80002fe8:	998080e7          	jalr	-1640(ra) # 8000197c <_ZN9Scheduler3putEP12KernelThread>
}
    80002fec:	01813083          	ld	ra,24(sp)
    80002ff0:	01013403          	ld	s0,16(sp)
    80002ff4:	00813483          	ld	s1,8(sp)
    80002ff8:	00013903          	ld	s2,0(sp)
    80002ffc:	02010113          	addi	sp,sp,32
    80003000:	00008067          	ret

0000000080003004 <_ZN12KernelThread5startEPS_>:

int KernelThread::start(KernelThread*k) {
    if(k->started)return -1;
    80003004:	02854783          	lbu	a5,40(a0)
    80003008:	02079c63          	bnez	a5,80003040 <_ZN12KernelThread5startEPS_+0x3c>
int KernelThread::start(KernelThread*k) {
    8000300c:	ff010113          	addi	sp,sp,-16
    80003010:	00113423          	sd	ra,8(sp)
    80003014:	00813023          	sd	s0,0(sp)
    80003018:	01010413          	addi	s0,sp,16
    else{
        k->started=true;
    8000301c:	00100793          	li	a5,1
    80003020:	02f50423          	sb	a5,40(a0)
        Scheduler::put(k);
    80003024:	fffff097          	auipc	ra,0xfffff
    80003028:	958080e7          	jalr	-1704(ra) # 8000197c <_ZN9Scheduler3putEP12KernelThread>
        return 0;
    8000302c:	00000513          	li	a0,0
    }
}
    80003030:	00813083          	ld	ra,8(sp)
    80003034:	00013403          	ld	s0,0(sp)
    80003038:	01010113          	addi	sp,sp,16
    8000303c:	00008067          	ret
    if(k->started)return -1;
    80003040:	fff00513          	li	a0,-1
}
    80003044:	00008067          	ret

0000000080003048 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80003048:	fe010113          	addi	sp,sp,-32
    8000304c:	00113c23          	sd	ra,24(sp)
    80003050:	00813823          	sd	s0,16(sp)
    80003054:	00913423          	sd	s1,8(sp)
    80003058:	02010413          	addi	s0,sp,32
    8000305c:	00050493          	mv	s1,a0
    LOCK();
    80003060:	00100613          	li	a2,1
    80003064:	00000593          	li	a1,0
    80003068:	00004517          	auipc	a0,0x4
    8000306c:	78050513          	addi	a0,a0,1920 # 800077e8 <lockPrint>
    80003070:	ffffe097          	auipc	ra,0xffffe
    80003074:	1bc080e7          	jalr	444(ra) # 8000122c <copy_and_swap>
    80003078:	fe0514e3          	bnez	a0,80003060 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    8000307c:	0004c503          	lbu	a0,0(s1)
    80003080:	00050a63          	beqz	a0,80003094 <_Z11printStringPKc+0x4c>
    {
        putc(*string);
    80003084:	ffffe097          	auipc	ra,0xffffe
    80003088:	418080e7          	jalr	1048(ra) # 8000149c <_Z4putcc>
        string++;
    8000308c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80003090:	fedff06f          	j	8000307c <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80003094:	00000613          	li	a2,0
    80003098:	00100593          	li	a1,1
    8000309c:	00004517          	auipc	a0,0x4
    800030a0:	74c50513          	addi	a0,a0,1868 # 800077e8 <lockPrint>
    800030a4:	ffffe097          	auipc	ra,0xffffe
    800030a8:	188080e7          	jalr	392(ra) # 8000122c <copy_and_swap>
    800030ac:	fe0514e3          	bnez	a0,80003094 <_Z11printStringPKc+0x4c>
}
    800030b0:	01813083          	ld	ra,24(sp)
    800030b4:	01013403          	ld	s0,16(sp)
    800030b8:	00813483          	ld	s1,8(sp)
    800030bc:	02010113          	addi	sp,sp,32
    800030c0:	00008067          	ret

00000000800030c4 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800030c4:	fd010113          	addi	sp,sp,-48
    800030c8:	02113423          	sd	ra,40(sp)
    800030cc:	02813023          	sd	s0,32(sp)
    800030d0:	00913c23          	sd	s1,24(sp)
    800030d4:	01213823          	sd	s2,16(sp)
    800030d8:	01313423          	sd	s3,8(sp)
    800030dc:	01413023          	sd	s4,0(sp)
    800030e0:	03010413          	addi	s0,sp,48
    800030e4:	00050993          	mv	s3,a0
    800030e8:	00058a13          	mv	s4,a1
    LOCK();
    800030ec:	00100613          	li	a2,1
    800030f0:	00000593          	li	a1,0
    800030f4:	00004517          	auipc	a0,0x4
    800030f8:	6f450513          	addi	a0,a0,1780 # 800077e8 <lockPrint>
    800030fc:	ffffe097          	auipc	ra,0xffffe
    80003100:	130080e7          	jalr	304(ra) # 8000122c <copy_and_swap>
    80003104:	fe0514e3          	bnez	a0,800030ec <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80003108:	00000913          	li	s2,0
    8000310c:	00090493          	mv	s1,s2
    80003110:	0019091b          	addiw	s2,s2,1
    80003114:	03495a63          	bge	s2,s4,80003148 <_Z9getStringPci+0x84>
        cc = getc();
    80003118:	ffffe097          	auipc	ra,0xffffe
    8000311c:	35c080e7          	jalr	860(ra) # 80001474 <_Z4getcv>
        if(cc < 1)
    80003120:	02050463          	beqz	a0,80003148 <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    80003124:	009984b3          	add	s1,s3,s1
    80003128:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    8000312c:	00a00793          	li	a5,10
    80003130:	00f50a63          	beq	a0,a5,80003144 <_Z9getStringPci+0x80>
    80003134:	00d00793          	li	a5,13
    80003138:	fcf51ae3          	bne	a0,a5,8000310c <_Z9getStringPci+0x48>
        buf[i++] = c;
    8000313c:	00090493          	mv	s1,s2
    80003140:	0080006f          	j	80003148 <_Z9getStringPci+0x84>
    80003144:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80003148:	009984b3          	add	s1,s3,s1
    8000314c:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80003150:	00000613          	li	a2,0
    80003154:	00100593          	li	a1,1
    80003158:	00004517          	auipc	a0,0x4
    8000315c:	69050513          	addi	a0,a0,1680 # 800077e8 <lockPrint>
    80003160:	ffffe097          	auipc	ra,0xffffe
    80003164:	0cc080e7          	jalr	204(ra) # 8000122c <copy_and_swap>
    80003168:	fe0514e3          	bnez	a0,80003150 <_Z9getStringPci+0x8c>
    return buf;
}
    8000316c:	00098513          	mv	a0,s3
    80003170:	02813083          	ld	ra,40(sp)
    80003174:	02013403          	ld	s0,32(sp)
    80003178:	01813483          	ld	s1,24(sp)
    8000317c:	01013903          	ld	s2,16(sp)
    80003180:	00813983          	ld	s3,8(sp)
    80003184:	00013a03          	ld	s4,0(sp)
    80003188:	03010113          	addi	sp,sp,48
    8000318c:	00008067          	ret

0000000080003190 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80003190:	ff010113          	addi	sp,sp,-16
    80003194:	00813423          	sd	s0,8(sp)
    80003198:	01010413          	addi	s0,sp,16
    8000319c:	00050693          	mv	a3,a0
    int n;

    n = 0;
    800031a0:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800031a4:	0006c603          	lbu	a2,0(a3) # 8000 <_entry-0x7fff8000>
    800031a8:	fd06071b          	addiw	a4,a2,-48
    800031ac:	0ff77713          	andi	a4,a4,255
    800031b0:	00900793          	li	a5,9
    800031b4:	02e7e063          	bltu	a5,a4,800031d4 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    800031b8:	0025179b          	slliw	a5,a0,0x2
    800031bc:	00a787bb          	addw	a5,a5,a0
    800031c0:	0017979b          	slliw	a5,a5,0x1
    800031c4:	00168693          	addi	a3,a3,1
    800031c8:	00c787bb          	addw	a5,a5,a2
    800031cc:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800031d0:	fd5ff06f          	j	800031a4 <_Z11stringToIntPKc+0x14>
    return n;
}
    800031d4:	00813403          	ld	s0,8(sp)
    800031d8:	01010113          	addi	sp,sp,16
    800031dc:	00008067          	ret

00000000800031e0 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800031e0:	fc010113          	addi	sp,sp,-64
    800031e4:	02113c23          	sd	ra,56(sp)
    800031e8:	02813823          	sd	s0,48(sp)
    800031ec:	02913423          	sd	s1,40(sp)
    800031f0:	03213023          	sd	s2,32(sp)
    800031f4:	01313c23          	sd	s3,24(sp)
    800031f8:	04010413          	addi	s0,sp,64
    800031fc:	00050493          	mv	s1,a0
    80003200:	00058913          	mv	s2,a1
    80003204:	00060993          	mv	s3,a2
    LOCK();
    80003208:	00100613          	li	a2,1
    8000320c:	00000593          	li	a1,0
    80003210:	00004517          	auipc	a0,0x4
    80003214:	5d850513          	addi	a0,a0,1496 # 800077e8 <lockPrint>
    80003218:	ffffe097          	auipc	ra,0xffffe
    8000321c:	014080e7          	jalr	20(ra) # 8000122c <copy_and_swap>
    80003220:	fe0514e3          	bnez	a0,80003208 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80003224:	00098463          	beqz	s3,8000322c <_Z8printIntiii+0x4c>
    80003228:	0804c463          	bltz	s1,800032b0 <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    8000322c:	0004851b          	sext.w	a0,s1
    neg = 0;
    80003230:	00000593          	li	a1,0
    }

    i = 0;
    80003234:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80003238:	0009079b          	sext.w	a5,s2
    8000323c:	0325773b          	remuw	a4,a0,s2
    80003240:	00048613          	mv	a2,s1
    80003244:	0014849b          	addiw	s1,s1,1
    80003248:	02071693          	slli	a3,a4,0x20
    8000324c:	0206d693          	srli	a3,a3,0x20
    80003250:	00004717          	auipc	a4,0x4
    80003254:	3f070713          	addi	a4,a4,1008 # 80007640 <digits>
    80003258:	00d70733          	add	a4,a4,a3
    8000325c:	00074683          	lbu	a3,0(a4)
    80003260:	fd040713          	addi	a4,s0,-48
    80003264:	00c70733          	add	a4,a4,a2
    80003268:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    8000326c:	0005071b          	sext.w	a4,a0
    80003270:	0325553b          	divuw	a0,a0,s2
    80003274:	fcf772e3          	bgeu	a4,a5,80003238 <_Z8printIntiii+0x58>
    if(neg)
    80003278:	00058c63          	beqz	a1,80003290 <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    8000327c:	fd040793          	addi	a5,s0,-48
    80003280:	009784b3          	add	s1,a5,s1
    80003284:	02d00793          	li	a5,45
    80003288:	fef48823          	sb	a5,-16(s1)
    8000328c:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80003290:	fff4849b          	addiw	s1,s1,-1
    80003294:	0204c463          	bltz	s1,800032bc <_Z8printIntiii+0xdc>
        putc(buf[i]);
    80003298:	fd040793          	addi	a5,s0,-48
    8000329c:	009787b3          	add	a5,a5,s1
    800032a0:	ff07c503          	lbu	a0,-16(a5)
    800032a4:	ffffe097          	auipc	ra,0xffffe
    800032a8:	1f8080e7          	jalr	504(ra) # 8000149c <_Z4putcc>
    800032ac:	fe5ff06f          	j	80003290 <_Z8printIntiii+0xb0>
        x = -xx;
    800032b0:	4090053b          	negw	a0,s1
        neg = 1;
    800032b4:	00100593          	li	a1,1
        x = -xx;
    800032b8:	f7dff06f          	j	80003234 <_Z8printIntiii+0x54>

    UNLOCK();
    800032bc:	00000613          	li	a2,0
    800032c0:	00100593          	li	a1,1
    800032c4:	00004517          	auipc	a0,0x4
    800032c8:	52450513          	addi	a0,a0,1316 # 800077e8 <lockPrint>
    800032cc:	ffffe097          	auipc	ra,0xffffe
    800032d0:	f60080e7          	jalr	-160(ra) # 8000122c <copy_and_swap>
    800032d4:	fe0514e3          	bnez	a0,800032bc <_Z8printIntiii+0xdc>
    800032d8:	03813083          	ld	ra,56(sp)
    800032dc:	03013403          	ld	s0,48(sp)
    800032e0:	02813483          	ld	s1,40(sp)
    800032e4:	02013903          	ld	s2,32(sp)
    800032e8:	01813983          	ld	s3,24(sp)
    800032ec:	04010113          	addi	sp,sp,64
    800032f0:	00008067          	ret

00000000800032f4 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800032f4:	fd010113          	addi	sp,sp,-48
    800032f8:	02113423          	sd	ra,40(sp)
    800032fc:	02813023          	sd	s0,32(sp)
    80003300:	00913c23          	sd	s1,24(sp)
    80003304:	01213823          	sd	s2,16(sp)
    80003308:	01313423          	sd	s3,8(sp)
    8000330c:	03010413          	addi	s0,sp,48
    80003310:	00050493          	mv	s1,a0
    80003314:	00058913          	mv	s2,a1
    80003318:	0015879b          	addiw	a5,a1,1
    8000331c:	0007851b          	sext.w	a0,a5
    80003320:	00f4a023          	sw	a5,0(s1)
    80003324:	0004a823          	sw	zero,16(s1)
    80003328:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000332c:	00251513          	slli	a0,a0,0x2
    80003330:	ffffe097          	auipc	ra,0xffffe
    80003334:	f1c080e7          	jalr	-228(ra) # 8000124c <_Z9mem_allocm>
    80003338:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    8000333c:	01000513          	li	a0,16
    80003340:	fffff097          	auipc	ra,0xfffff
    80003344:	8fc080e7          	jalr	-1796(ra) # 80001c3c <_Znwm>
    80003348:	00050993          	mv	s3,a0
    8000334c:	00000593          	li	a1,0
    80003350:	fffff097          	auipc	ra,0xfffff
    80003354:	adc080e7          	jalr	-1316(ra) # 80001e2c <_ZN9SemaphoreC1Ej>
    80003358:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    8000335c:	01000513          	li	a0,16
    80003360:	fffff097          	auipc	ra,0xfffff
    80003364:	8dc080e7          	jalr	-1828(ra) # 80001c3c <_Znwm>
    80003368:	00050993          	mv	s3,a0
    8000336c:	00090593          	mv	a1,s2
    80003370:	fffff097          	auipc	ra,0xfffff
    80003374:	abc080e7          	jalr	-1348(ra) # 80001e2c <_ZN9SemaphoreC1Ej>
    80003378:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    8000337c:	01000513          	li	a0,16
    80003380:	fffff097          	auipc	ra,0xfffff
    80003384:	8bc080e7          	jalr	-1860(ra) # 80001c3c <_Znwm>
    80003388:	00050913          	mv	s2,a0
    8000338c:	00100593          	li	a1,1
    80003390:	fffff097          	auipc	ra,0xfffff
    80003394:	a9c080e7          	jalr	-1380(ra) # 80001e2c <_ZN9SemaphoreC1Ej>
    80003398:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    8000339c:	01000513          	li	a0,16
    800033a0:	fffff097          	auipc	ra,0xfffff
    800033a4:	89c080e7          	jalr	-1892(ra) # 80001c3c <_Znwm>
    800033a8:	00050913          	mv	s2,a0
    800033ac:	00100593          	li	a1,1
    800033b0:	fffff097          	auipc	ra,0xfffff
    800033b4:	a7c080e7          	jalr	-1412(ra) # 80001e2c <_ZN9SemaphoreC1Ej>
    800033b8:	0324b823          	sd	s2,48(s1)
}
    800033bc:	02813083          	ld	ra,40(sp)
    800033c0:	02013403          	ld	s0,32(sp)
    800033c4:	01813483          	ld	s1,24(sp)
    800033c8:	01013903          	ld	s2,16(sp)
    800033cc:	00813983          	ld	s3,8(sp)
    800033d0:	03010113          	addi	sp,sp,48
    800033d4:	00008067          	ret
    800033d8:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    800033dc:	00098513          	mv	a0,s3
    800033e0:	fffff097          	auipc	ra,0xfffff
    800033e4:	8ac080e7          	jalr	-1876(ra) # 80001c8c <_ZdlPv>
    800033e8:	00048513          	mv	a0,s1
    800033ec:	00005097          	auipc	ra,0x5
    800033f0:	4dc080e7          	jalr	1244(ra) # 800088c8 <_Unwind_Resume>
    800033f4:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    800033f8:	00098513          	mv	a0,s3
    800033fc:	fffff097          	auipc	ra,0xfffff
    80003400:	890080e7          	jalr	-1904(ra) # 80001c8c <_ZdlPv>
    80003404:	00048513          	mv	a0,s1
    80003408:	00005097          	auipc	ra,0x5
    8000340c:	4c0080e7          	jalr	1216(ra) # 800088c8 <_Unwind_Resume>
    80003410:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80003414:	00090513          	mv	a0,s2
    80003418:	fffff097          	auipc	ra,0xfffff
    8000341c:	874080e7          	jalr	-1932(ra) # 80001c8c <_ZdlPv>
    80003420:	00048513          	mv	a0,s1
    80003424:	00005097          	auipc	ra,0x5
    80003428:	4a4080e7          	jalr	1188(ra) # 800088c8 <_Unwind_Resume>
    8000342c:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80003430:	00090513          	mv	a0,s2
    80003434:	fffff097          	auipc	ra,0xfffff
    80003438:	858080e7          	jalr	-1960(ra) # 80001c8c <_ZdlPv>
    8000343c:	00048513          	mv	a0,s1
    80003440:	00005097          	auipc	ra,0x5
    80003444:	488080e7          	jalr	1160(ra) # 800088c8 <_Unwind_Resume>

0000000080003448 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80003448:	fe010113          	addi	sp,sp,-32
    8000344c:	00113c23          	sd	ra,24(sp)
    80003450:	00813823          	sd	s0,16(sp)
    80003454:	00913423          	sd	s1,8(sp)
    80003458:	01213023          	sd	s2,0(sp)
    8000345c:	02010413          	addi	s0,sp,32
    80003460:	00050493          	mv	s1,a0
    80003464:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80003468:	01853503          	ld	a0,24(a0)
    8000346c:	fffff097          	auipc	ra,0xfffff
    80003470:	9f8080e7          	jalr	-1544(ra) # 80001e64 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80003474:	0304b503          	ld	a0,48(s1)
    80003478:	fffff097          	auipc	ra,0xfffff
    8000347c:	9ec080e7          	jalr	-1556(ra) # 80001e64 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80003480:	0084b783          	ld	a5,8(s1)
    80003484:	0144a703          	lw	a4,20(s1)
    80003488:	00271713          	slli	a4,a4,0x2
    8000348c:	00e787b3          	add	a5,a5,a4
    80003490:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80003494:	0144a783          	lw	a5,20(s1)
    80003498:	0017879b          	addiw	a5,a5,1
    8000349c:	0004a703          	lw	a4,0(s1)
    800034a0:	02e7e7bb          	remw	a5,a5,a4
    800034a4:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    800034a8:	0304b503          	ld	a0,48(s1)
    800034ac:	fffff097          	auipc	ra,0xfffff
    800034b0:	9e4080e7          	jalr	-1564(ra) # 80001e90 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    800034b4:	0204b503          	ld	a0,32(s1)
    800034b8:	fffff097          	auipc	ra,0xfffff
    800034bc:	9d8080e7          	jalr	-1576(ra) # 80001e90 <_ZN9Semaphore6signalEv>

}
    800034c0:	01813083          	ld	ra,24(sp)
    800034c4:	01013403          	ld	s0,16(sp)
    800034c8:	00813483          	ld	s1,8(sp)
    800034cc:	00013903          	ld	s2,0(sp)
    800034d0:	02010113          	addi	sp,sp,32
    800034d4:	00008067          	ret

00000000800034d8 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    800034d8:	fe010113          	addi	sp,sp,-32
    800034dc:	00113c23          	sd	ra,24(sp)
    800034e0:	00813823          	sd	s0,16(sp)
    800034e4:	00913423          	sd	s1,8(sp)
    800034e8:	01213023          	sd	s2,0(sp)
    800034ec:	02010413          	addi	s0,sp,32
    800034f0:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800034f4:	02053503          	ld	a0,32(a0)
    800034f8:	fffff097          	auipc	ra,0xfffff
    800034fc:	96c080e7          	jalr	-1684(ra) # 80001e64 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80003500:	0284b503          	ld	a0,40(s1)
    80003504:	fffff097          	auipc	ra,0xfffff
    80003508:	960080e7          	jalr	-1696(ra) # 80001e64 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    8000350c:	0084b703          	ld	a4,8(s1)
    80003510:	0104a783          	lw	a5,16(s1)
    80003514:	00279693          	slli	a3,a5,0x2
    80003518:	00d70733          	add	a4,a4,a3
    8000351c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80003520:	0017879b          	addiw	a5,a5,1
    80003524:	0004a703          	lw	a4,0(s1)
    80003528:	02e7e7bb          	remw	a5,a5,a4
    8000352c:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80003530:	0284b503          	ld	a0,40(s1)
    80003534:	fffff097          	auipc	ra,0xfffff
    80003538:	95c080e7          	jalr	-1700(ra) # 80001e90 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    8000353c:	0184b503          	ld	a0,24(s1)
    80003540:	fffff097          	auipc	ra,0xfffff
    80003544:	950080e7          	jalr	-1712(ra) # 80001e90 <_ZN9Semaphore6signalEv>

    return ret;
}
    80003548:	00090513          	mv	a0,s2
    8000354c:	01813083          	ld	ra,24(sp)
    80003550:	01013403          	ld	s0,16(sp)
    80003554:	00813483          	ld	s1,8(sp)
    80003558:	00013903          	ld	s2,0(sp)
    8000355c:	02010113          	addi	sp,sp,32
    80003560:	00008067          	ret

0000000080003564 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80003564:	fe010113          	addi	sp,sp,-32
    80003568:	00113c23          	sd	ra,24(sp)
    8000356c:	00813823          	sd	s0,16(sp)
    80003570:	00913423          	sd	s1,8(sp)
    80003574:	01213023          	sd	s2,0(sp)
    80003578:	02010413          	addi	s0,sp,32
    8000357c:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80003580:	02853503          	ld	a0,40(a0)
    80003584:	fffff097          	auipc	ra,0xfffff
    80003588:	8e0080e7          	jalr	-1824(ra) # 80001e64 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    8000358c:	0304b503          	ld	a0,48(s1)
    80003590:	fffff097          	auipc	ra,0xfffff
    80003594:	8d4080e7          	jalr	-1836(ra) # 80001e64 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80003598:	0144a783          	lw	a5,20(s1)
    8000359c:	0104a903          	lw	s2,16(s1)
    800035a0:	0327ce63          	blt	a5,s2,800035dc <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    800035a4:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    800035a8:	0304b503          	ld	a0,48(s1)
    800035ac:	fffff097          	auipc	ra,0xfffff
    800035b0:	8e4080e7          	jalr	-1820(ra) # 80001e90 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    800035b4:	0284b503          	ld	a0,40(s1)
    800035b8:	fffff097          	auipc	ra,0xfffff
    800035bc:	8d8080e7          	jalr	-1832(ra) # 80001e90 <_ZN9Semaphore6signalEv>

    return ret;
}
    800035c0:	00090513          	mv	a0,s2
    800035c4:	01813083          	ld	ra,24(sp)
    800035c8:	01013403          	ld	s0,16(sp)
    800035cc:	00813483          	ld	s1,8(sp)
    800035d0:	00013903          	ld	s2,0(sp)
    800035d4:	02010113          	addi	sp,sp,32
    800035d8:	00008067          	ret
        ret = cap - head + tail;
    800035dc:	0004a703          	lw	a4,0(s1)
    800035e0:	4127093b          	subw	s2,a4,s2
    800035e4:	00f9093b          	addw	s2,s2,a5
    800035e8:	fc1ff06f          	j	800035a8 <_ZN9BufferCPP6getCntEv+0x44>

00000000800035ec <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800035ec:	fe010113          	addi	sp,sp,-32
    800035f0:	00113c23          	sd	ra,24(sp)
    800035f4:	00813823          	sd	s0,16(sp)
    800035f8:	00913423          	sd	s1,8(sp)
    800035fc:	02010413          	addi	s0,sp,32
    80003600:	00050493          	mv	s1,a0
    Console::putc('\n');
    80003604:	00a00513          	li	a0,10
    80003608:	fffff097          	auipc	ra,0xfffff
    8000360c:	94c080e7          	jalr	-1716(ra) # 80001f54 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80003610:	00003517          	auipc	a0,0x3
    80003614:	a1050513          	addi	a0,a0,-1520 # 80006020 <CONSOLE_STATUS+0x10>
    80003618:	00000097          	auipc	ra,0x0
    8000361c:	a30080e7          	jalr	-1488(ra) # 80003048 <_Z11printStringPKc>
    while (getCnt()) {
    80003620:	00048513          	mv	a0,s1
    80003624:	00000097          	auipc	ra,0x0
    80003628:	f40080e7          	jalr	-192(ra) # 80003564 <_ZN9BufferCPP6getCntEv>
    8000362c:	02050c63          	beqz	a0,80003664 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80003630:	0084b783          	ld	a5,8(s1)
    80003634:	0104a703          	lw	a4,16(s1)
    80003638:	00271713          	slli	a4,a4,0x2
    8000363c:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80003640:	0007c503          	lbu	a0,0(a5)
    80003644:	fffff097          	auipc	ra,0xfffff
    80003648:	910080e7          	jalr	-1776(ra) # 80001f54 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    8000364c:	0104a783          	lw	a5,16(s1)
    80003650:	0017879b          	addiw	a5,a5,1
    80003654:	0004a703          	lw	a4,0(s1)
    80003658:	02e7e7bb          	remw	a5,a5,a4
    8000365c:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80003660:	fc1ff06f          	j	80003620 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80003664:	02100513          	li	a0,33
    80003668:	fffff097          	auipc	ra,0xfffff
    8000366c:	8ec080e7          	jalr	-1812(ra) # 80001f54 <_ZN7Console4putcEc>
    Console::putc('\n');
    80003670:	00a00513          	li	a0,10
    80003674:	fffff097          	auipc	ra,0xfffff
    80003678:	8e0080e7          	jalr	-1824(ra) # 80001f54 <_ZN7Console4putcEc>
    mem_free(buffer);
    8000367c:	0084b503          	ld	a0,8(s1)
    80003680:	ffffe097          	auipc	ra,0xffffe
    80003684:	c04080e7          	jalr	-1020(ra) # 80001284 <_Z8mem_freePv>
    delete itemAvailable;
    80003688:	0204b503          	ld	a0,32(s1)
    8000368c:	00050863          	beqz	a0,8000369c <_ZN9BufferCPPD1Ev+0xb0>
    80003690:	00053783          	ld	a5,0(a0)
    80003694:	0087b783          	ld	a5,8(a5)
    80003698:	000780e7          	jalr	a5
    delete spaceAvailable;
    8000369c:	0184b503          	ld	a0,24(s1)
    800036a0:	00050863          	beqz	a0,800036b0 <_ZN9BufferCPPD1Ev+0xc4>
    800036a4:	00053783          	ld	a5,0(a0)
    800036a8:	0087b783          	ld	a5,8(a5)
    800036ac:	000780e7          	jalr	a5
    delete mutexTail;
    800036b0:	0304b503          	ld	a0,48(s1)
    800036b4:	00050863          	beqz	a0,800036c4 <_ZN9BufferCPPD1Ev+0xd8>
    800036b8:	00053783          	ld	a5,0(a0)
    800036bc:	0087b783          	ld	a5,8(a5)
    800036c0:	000780e7          	jalr	a5
    delete mutexHead;
    800036c4:	0284b503          	ld	a0,40(s1)
    800036c8:	00050863          	beqz	a0,800036d8 <_ZN9BufferCPPD1Ev+0xec>
    800036cc:	00053783          	ld	a5,0(a0)
    800036d0:	0087b783          	ld	a5,8(a5)
    800036d4:	000780e7          	jalr	a5
}
    800036d8:	01813083          	ld	ra,24(sp)
    800036dc:	01013403          	ld	s0,16(sp)
    800036e0:	00813483          	ld	s1,8(sp)
    800036e4:	02010113          	addi	sp,sp,32
    800036e8:	00008067          	ret

00000000800036ec <_ZN19ConsumerProducerCPP20testConsumerProducerEv>:

            td->sem->signal();
        }
    };

    void testConsumerProducer() {
    800036ec:	f8010113          	addi	sp,sp,-128
    800036f0:	06113c23          	sd	ra,120(sp)
    800036f4:	06813823          	sd	s0,112(sp)
    800036f8:	06913423          	sd	s1,104(sp)
    800036fc:	07213023          	sd	s2,96(sp)
    80003700:	05313c23          	sd	s3,88(sp)
    80003704:	05413823          	sd	s4,80(sp)
    80003708:	05513423          	sd	s5,72(sp)
    8000370c:	05613023          	sd	s6,64(sp)
    80003710:	03713c23          	sd	s7,56(sp)
    80003714:	03813823          	sd	s8,48(sp)
    80003718:	03913423          	sd	s9,40(sp)
    8000371c:	08010413          	addi	s0,sp,128
        delete waitForAll;
        for (int i = 0; i < threadNum; i++) {
            delete producers[i];
        }
        delete consumer;
        delete buffer;
    80003720:	00010c13          	mv	s8,sp
        printString("Unesite broj proizvodjaca?\n");
    80003724:	00003517          	auipc	a0,0x3
    80003728:	91450513          	addi	a0,a0,-1772 # 80006038 <CONSOLE_STATUS+0x28>
    8000372c:	00000097          	auipc	ra,0x0
    80003730:	91c080e7          	jalr	-1764(ra) # 80003048 <_Z11printStringPKc>
        getString(input, 30);
    80003734:	01e00593          	li	a1,30
    80003738:	f8040493          	addi	s1,s0,-128
    8000373c:	00048513          	mv	a0,s1
    80003740:	00000097          	auipc	ra,0x0
    80003744:	984080e7          	jalr	-1660(ra) # 800030c4 <_Z9getStringPci>
        threadNum = stringToInt(input);
    80003748:	00048513          	mv	a0,s1
    8000374c:	00000097          	auipc	ra,0x0
    80003750:	a44080e7          	jalr	-1468(ra) # 80003190 <_Z11stringToIntPKc>
    80003754:	00050993          	mv	s3,a0
        printString("Unesite velicinu bafera?\n");
    80003758:	00003517          	auipc	a0,0x3
    8000375c:	90050513          	addi	a0,a0,-1792 # 80006058 <CONSOLE_STATUS+0x48>
    80003760:	00000097          	auipc	ra,0x0
    80003764:	8e8080e7          	jalr	-1816(ra) # 80003048 <_Z11printStringPKc>
        getString(input, 30);
    80003768:	01e00593          	li	a1,30
    8000376c:	00048513          	mv	a0,s1
    80003770:	00000097          	auipc	ra,0x0
    80003774:	954080e7          	jalr	-1708(ra) # 800030c4 <_Z9getStringPci>
        n = stringToInt(input);
    80003778:	00048513          	mv	a0,s1
    8000377c:	00000097          	auipc	ra,0x0
    80003780:	a14080e7          	jalr	-1516(ra) # 80003190 <_Z11stringToIntPKc>
    80003784:	00050493          	mv	s1,a0
        printString("Broj proizvodjaca "); printInt(threadNum);
    80003788:	00003517          	auipc	a0,0x3
    8000378c:	8f050513          	addi	a0,a0,-1808 # 80006078 <CONSOLE_STATUS+0x68>
    80003790:	00000097          	auipc	ra,0x0
    80003794:	8b8080e7          	jalr	-1864(ra) # 80003048 <_Z11printStringPKc>
    80003798:	00000613          	li	a2,0
    8000379c:	00a00593          	li	a1,10
    800037a0:	00098513          	mv	a0,s3
    800037a4:	00000097          	auipc	ra,0x0
    800037a8:	a3c080e7          	jalr	-1476(ra) # 800031e0 <_Z8printIntiii>
        printString(" i velicina bafera "); printInt(n);
    800037ac:	00003517          	auipc	a0,0x3
    800037b0:	8e450513          	addi	a0,a0,-1820 # 80006090 <CONSOLE_STATUS+0x80>
    800037b4:	00000097          	auipc	ra,0x0
    800037b8:	894080e7          	jalr	-1900(ra) # 80003048 <_Z11printStringPKc>
    800037bc:	00000613          	li	a2,0
    800037c0:	00a00593          	li	a1,10
    800037c4:	00048513          	mv	a0,s1
    800037c8:	00000097          	auipc	ra,0x0
    800037cc:	a18080e7          	jalr	-1512(ra) # 800031e0 <_Z8printIntiii>
        printString(".\n");
    800037d0:	00003517          	auipc	a0,0x3
    800037d4:	8d850513          	addi	a0,a0,-1832 # 800060a8 <CONSOLE_STATUS+0x98>
    800037d8:	00000097          	auipc	ra,0x0
    800037dc:	870080e7          	jalr	-1936(ra) # 80003048 <_Z11printStringPKc>
        if(threadNum > n) {
    800037e0:	0334c463          	blt	s1,s3,80003808 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x11c>
        } else if (threadNum < 1) {
    800037e4:	03305c63          	blez	s3,8000381c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x130>
        BufferCPP *buffer = new BufferCPP(n);
    800037e8:	03800513          	li	a0,56
    800037ec:	ffffe097          	auipc	ra,0xffffe
    800037f0:	450080e7          	jalr	1104(ra) # 80001c3c <_Znwm>
    800037f4:	00050a93          	mv	s5,a0
    800037f8:	00048593          	mv	a1,s1
    800037fc:	00000097          	auipc	ra,0x0
    80003800:	af8080e7          	jalr	-1288(ra) # 800032f4 <_ZN9BufferCPPC1Ei>
    80003804:	0300006f          	j	80003834 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x148>
            printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003808:	00003517          	auipc	a0,0x3
    8000380c:	8a850513          	addi	a0,a0,-1880 # 800060b0 <CONSOLE_STATUS+0xa0>
    80003810:	00000097          	auipc	ra,0x0
    80003814:	838080e7          	jalr	-1992(ra) # 80003048 <_Z11printStringPKc>
            return;
    80003818:	0140006f          	j	8000382c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x140>
            printString("Broj proizvodjaca mora biti veci od nula!\n");
    8000381c:	00003517          	auipc	a0,0x3
    80003820:	8d450513          	addi	a0,a0,-1836 # 800060f0 <CONSOLE_STATUS+0xe0>
    80003824:	00000097          	auipc	ra,0x0
    80003828:	824080e7          	jalr	-2012(ra) # 80003048 <_Z11printStringPKc>
            return;
    8000382c:	000c0113          	mv	sp,s8
    80003830:	21c0006f          	j	80003a4c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x360>
        waitForAll = new Semaphore(0);
    80003834:	01000513          	li	a0,16
    80003838:	ffffe097          	auipc	ra,0xffffe
    8000383c:	404080e7          	jalr	1028(ra) # 80001c3c <_Znwm>
    80003840:	00050493          	mv	s1,a0
    80003844:	00000593          	li	a1,0
    80003848:	ffffe097          	auipc	ra,0xffffe
    8000384c:	5e4080e7          	jalr	1508(ra) # 80001e2c <_ZN9SemaphoreC1Ej>
    80003850:	00004717          	auipc	a4,0x4
    80003854:	fa070713          	addi	a4,a4,-96 # 800077f0 <_ZN19ConsumerProducerCPP9threadEndE>
    80003858:	00973423          	sd	s1,8(a4)
        Thread *producers[threadNum];
    8000385c:	00399793          	slli	a5,s3,0x3
    80003860:	00f78793          	addi	a5,a5,15
    80003864:	ff07f793          	andi	a5,a5,-16
    80003868:	40f10133          	sub	sp,sp,a5
    8000386c:	00010a13          	mv	s4,sp
        thread_data threadData[threadNum + 1];
    80003870:	0019869b          	addiw	a3,s3,1
    80003874:	00169793          	slli	a5,a3,0x1
    80003878:	00d787b3          	add	a5,a5,a3
    8000387c:	00379793          	slli	a5,a5,0x3
    80003880:	00f78793          	addi	a5,a5,15
    80003884:	ff07f793          	andi	a5,a5,-16
    80003888:	40f10133          	sub	sp,sp,a5
    8000388c:	00010b13          	mv	s6,sp
        threadData[threadNum].id = threadNum;
    80003890:	00199493          	slli	s1,s3,0x1
    80003894:	013484b3          	add	s1,s1,s3
    80003898:	00349493          	slli	s1,s1,0x3
    8000389c:	009b04b3          	add	s1,s6,s1
    800038a0:	0134a023          	sw	s3,0(s1)
        threadData[threadNum].buffer = buffer;
    800038a4:	0154b423          	sd	s5,8(s1)
        threadData[threadNum].sem = waitForAll;
    800038a8:	00873783          	ld	a5,8(a4)
    800038ac:	00f4b823          	sd	a5,16(s1)
        Thread *consumer = new Consumer(&threadData[threadNum]);
    800038b0:	01800513          	li	a0,24
    800038b4:	ffffe097          	auipc	ra,0xffffe
    800038b8:	388080e7          	jalr	904(ra) # 80001c3c <_Znwm>
    800038bc:	00050b93          	mv	s7,a0
        Consumer(thread_data *_td) : Thread(), td(_td) {}
    800038c0:	ffffe097          	auipc	ra,0xffffe
    800038c4:	538080e7          	jalr	1336(ra) # 80001df8 <_ZN6ThreadC1Ev>
    800038c8:	00004797          	auipc	a5,0x4
    800038cc:	df078793          	addi	a5,a5,-528 # 800076b8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    800038d0:	00fbb023          	sd	a5,0(s7)
    800038d4:	009bb823          	sd	s1,16(s7)
        consumer->start();
    800038d8:	000b8513          	mv	a0,s7
    800038dc:	ffffe097          	auipc	ra,0xffffe
    800038e0:	4a0080e7          	jalr	1184(ra) # 80001d7c <_ZN6Thread5startEv>
        threadData[0].id = 0;
    800038e4:	000b2023          	sw	zero,0(s6)
        threadData[0].buffer = buffer;
    800038e8:	015b3423          	sd	s5,8(s6)
        threadData[0].sem = waitForAll;
    800038ec:	00004797          	auipc	a5,0x4
    800038f0:	f0c7b783          	ld	a5,-244(a5) # 800077f8 <_ZN19ConsumerProducerCPP10waitForAllE>
    800038f4:	00fb3823          	sd	a5,16(s6)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    800038f8:	01800513          	li	a0,24
    800038fc:	ffffe097          	auipc	ra,0xffffe
    80003900:	340080e7          	jalr	832(ra) # 80001c3c <_Znwm>
    80003904:	00050493          	mv	s1,a0
        ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80003908:	ffffe097          	auipc	ra,0xffffe
    8000390c:	4f0080e7          	jalr	1264(ra) # 80001df8 <_ZN6ThreadC1Ev>
    80003910:	00004797          	auipc	a5,0x4
    80003914:	d5878793          	addi	a5,a5,-680 # 80007668 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80003918:	00f4b023          	sd	a5,0(s1)
    8000391c:	0164b823          	sd	s6,16(s1)
        producers[0] = new ProducerKeyborad(&threadData[0]);
    80003920:	009a3023          	sd	s1,0(s4)
        producers[0]->start();
    80003924:	00048513          	mv	a0,s1
    80003928:	ffffe097          	auipc	ra,0xffffe
    8000392c:	454080e7          	jalr	1108(ra) # 80001d7c <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    80003930:	00100913          	li	s2,1
    80003934:	0300006f          	j	80003964 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x278>
        Producer(thread_data *_td) : Thread(), td(_td) {}
    80003938:	00004797          	auipc	a5,0x4
    8000393c:	d5878793          	addi	a5,a5,-680 # 80007690 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    80003940:	00fcb023          	sd	a5,0(s9)
    80003944:	009cb823          	sd	s1,16(s9)
            producers[i] = new Producer(&threadData[i]);
    80003948:	00391793          	slli	a5,s2,0x3
    8000394c:	00fa07b3          	add	a5,s4,a5
    80003950:	0197b023          	sd	s9,0(a5)
            producers[i]->start();
    80003954:	000c8513          	mv	a0,s9
    80003958:	ffffe097          	auipc	ra,0xffffe
    8000395c:	424080e7          	jalr	1060(ra) # 80001d7c <_ZN6Thread5startEv>
        for (int i = 1; i < threadNum; i++) {
    80003960:	0019091b          	addiw	s2,s2,1
    80003964:	05395263          	bge	s2,s3,800039a8 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2bc>
            threadData[i].id = i;
    80003968:	00191493          	slli	s1,s2,0x1
    8000396c:	012484b3          	add	s1,s1,s2
    80003970:	00349493          	slli	s1,s1,0x3
    80003974:	009b04b3          	add	s1,s6,s1
    80003978:	0124a023          	sw	s2,0(s1)
            threadData[i].buffer = buffer;
    8000397c:	0154b423          	sd	s5,8(s1)
            threadData[i].sem = waitForAll;
    80003980:	00004797          	auipc	a5,0x4
    80003984:	e787b783          	ld	a5,-392(a5) # 800077f8 <_ZN19ConsumerProducerCPP10waitForAllE>
    80003988:	00f4b823          	sd	a5,16(s1)
            producers[i] = new Producer(&threadData[i]);
    8000398c:	01800513          	li	a0,24
    80003990:	ffffe097          	auipc	ra,0xffffe
    80003994:	2ac080e7          	jalr	684(ra) # 80001c3c <_Znwm>
    80003998:	00050c93          	mv	s9,a0
        Producer(thread_data *_td) : Thread(), td(_td) {}
    8000399c:	ffffe097          	auipc	ra,0xffffe
    800039a0:	45c080e7          	jalr	1116(ra) # 80001df8 <_ZN6ThreadC1Ev>
    800039a4:	f95ff06f          	j	80003938 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x24c>
        Thread::dispatch();
    800039a8:	ffffe097          	auipc	ra,0xffffe
    800039ac:	400080e7          	jalr	1024(ra) # 80001da8 <_ZN6Thread8dispatchEv>
        for (int i = 0; i <= threadNum; i++) {
    800039b0:	00000493          	li	s1,0
    800039b4:	0099ce63          	blt	s3,s1,800039d0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2e4>
            waitForAll->wait();
    800039b8:	00004517          	auipc	a0,0x4
    800039bc:	e4053503          	ld	a0,-448(a0) # 800077f8 <_ZN19ConsumerProducerCPP10waitForAllE>
    800039c0:	ffffe097          	auipc	ra,0xffffe
    800039c4:	4a4080e7          	jalr	1188(ra) # 80001e64 <_ZN9Semaphore4waitEv>
        for (int i = 0; i <= threadNum; i++) {
    800039c8:	0014849b          	addiw	s1,s1,1
    800039cc:	fe9ff06f          	j	800039b4 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2c8>
        delete waitForAll;
    800039d0:	00004517          	auipc	a0,0x4
    800039d4:	e2853503          	ld	a0,-472(a0) # 800077f8 <_ZN19ConsumerProducerCPP10waitForAllE>
    800039d8:	00050863          	beqz	a0,800039e8 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x2fc>
    800039dc:	00053783          	ld	a5,0(a0)
    800039e0:	0087b783          	ld	a5,8(a5)
    800039e4:	000780e7          	jalr	a5
        for (int i = 0; i <= threadNum; i++) {
    800039e8:	00000493          	li	s1,0
    800039ec:	0080006f          	j	800039f4 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x308>
        for (int i = 0; i < threadNum; i++) {
    800039f0:	0014849b          	addiw	s1,s1,1
    800039f4:	0334d263          	bge	s1,s3,80003a18 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x32c>
            delete producers[i];
    800039f8:	00349793          	slli	a5,s1,0x3
    800039fc:	00fa07b3          	add	a5,s4,a5
    80003a00:	0007b503          	ld	a0,0(a5)
    80003a04:	fe0506e3          	beqz	a0,800039f0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x304>
    80003a08:	00053783          	ld	a5,0(a0)
    80003a0c:	0087b783          	ld	a5,8(a5)
    80003a10:	000780e7          	jalr	a5
    80003a14:	fddff06f          	j	800039f0 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x304>
        delete consumer;
    80003a18:	000b8a63          	beqz	s7,80003a2c <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x340>
    80003a1c:	000bb783          	ld	a5,0(s7)
    80003a20:	0087b783          	ld	a5,8(a5)
    80003a24:	000b8513          	mv	a0,s7
    80003a28:	000780e7          	jalr	a5
        delete buffer;
    80003a2c:	000a8e63          	beqz	s5,80003a48 <_ZN19ConsumerProducerCPP20testConsumerProducerEv+0x35c>
    80003a30:	000a8513          	mv	a0,s5
    80003a34:	00000097          	auipc	ra,0x0
    80003a38:	bb8080e7          	jalr	-1096(ra) # 800035ec <_ZN9BufferCPPD1Ev>
    80003a3c:	000a8513          	mv	a0,s5
    80003a40:	ffffe097          	auipc	ra,0xffffe
    80003a44:	24c080e7          	jalr	588(ra) # 80001c8c <_ZdlPv>
    80003a48:	000c0113          	mv	sp,s8
    }
    80003a4c:	f8040113          	addi	sp,s0,-128
    80003a50:	07813083          	ld	ra,120(sp)
    80003a54:	07013403          	ld	s0,112(sp)
    80003a58:	06813483          	ld	s1,104(sp)
    80003a5c:	06013903          	ld	s2,96(sp)
    80003a60:	05813983          	ld	s3,88(sp)
    80003a64:	05013a03          	ld	s4,80(sp)
    80003a68:	04813a83          	ld	s5,72(sp)
    80003a6c:	04013b03          	ld	s6,64(sp)
    80003a70:	03813b83          	ld	s7,56(sp)
    80003a74:	03013c03          	ld	s8,48(sp)
    80003a78:	02813c83          	ld	s9,40(sp)
    80003a7c:	08010113          	addi	sp,sp,128
    80003a80:	00008067          	ret
    80003a84:	00050493          	mv	s1,a0
        BufferCPP *buffer = new BufferCPP(n);
    80003a88:	000a8513          	mv	a0,s5
    80003a8c:	ffffe097          	auipc	ra,0xffffe
    80003a90:	200080e7          	jalr	512(ra) # 80001c8c <_ZdlPv>
    80003a94:	00048513          	mv	a0,s1
    80003a98:	00005097          	auipc	ra,0x5
    80003a9c:	e30080e7          	jalr	-464(ra) # 800088c8 <_Unwind_Resume>
    80003aa0:	00050913          	mv	s2,a0
        waitForAll = new Semaphore(0);
    80003aa4:	00048513          	mv	a0,s1
    80003aa8:	ffffe097          	auipc	ra,0xffffe
    80003aac:	1e4080e7          	jalr	484(ra) # 80001c8c <_ZdlPv>
    80003ab0:	00090513          	mv	a0,s2
    80003ab4:	00005097          	auipc	ra,0x5
    80003ab8:	e14080e7          	jalr	-492(ra) # 800088c8 <_Unwind_Resume>
    80003abc:	00050493          	mv	s1,a0
        Thread *consumer = new Consumer(&threadData[threadNum]);
    80003ac0:	000b8513          	mv	a0,s7
    80003ac4:	ffffe097          	auipc	ra,0xffffe
    80003ac8:	1c8080e7          	jalr	456(ra) # 80001c8c <_ZdlPv>
    80003acc:	00048513          	mv	a0,s1
    80003ad0:	00005097          	auipc	ra,0x5
    80003ad4:	df8080e7          	jalr	-520(ra) # 800088c8 <_Unwind_Resume>
    80003ad8:	00050913          	mv	s2,a0
        producers[0] = new ProducerKeyborad(&threadData[0]);
    80003adc:	00048513          	mv	a0,s1
    80003ae0:	ffffe097          	auipc	ra,0xffffe
    80003ae4:	1ac080e7          	jalr	428(ra) # 80001c8c <_ZdlPv>
    80003ae8:	00090513          	mv	a0,s2
    80003aec:	00005097          	auipc	ra,0x5
    80003af0:	ddc080e7          	jalr	-548(ra) # 800088c8 <_Unwind_Resume>
    80003af4:	00050493          	mv	s1,a0
            producers[i] = new Producer(&threadData[i]);
    80003af8:	000c8513          	mv	a0,s9
    80003afc:	ffffe097          	auipc	ra,0xffffe
    80003b00:	190080e7          	jalr	400(ra) # 80001c8c <_ZdlPv>
    80003b04:	00048513          	mv	a0,s1
    80003b08:	00005097          	auipc	ra,0x5
    80003b0c:	dc0080e7          	jalr	-576(ra) # 800088c8 <_Unwind_Resume>

0000000080003b10 <_Z8userMainv>:
//#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta
#include "userMain.hpp"
void userMain() {
    80003b10:	ff010113          	addi	sp,sp,-16
    80003b14:	00113423          	sd	ra,8(sp)
    80003b18:	00813023          	sd	s0,0(sp)
    80003b1c:	01010413          	addi	s0,sp,16

    //producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

  //  testSleeping(); // thread_sleep test C API
    ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega
    80003b20:	00000097          	auipc	ra,0x0
    80003b24:	bcc080e7          	jalr	-1076(ra) # 800036ec <_ZN19ConsumerProducerCPP20testConsumerProducerEv>

}
    80003b28:	00813083          	ld	ra,8(sp)
    80003b2c:	00013403          	ld	s0,0(sp)
    80003b30:	01010113          	addi	sp,sp,16
    80003b34:	00008067          	ret

0000000080003b38 <_ZN19ConsumerProducerCPP8Consumer3runEv>:
        void run() override {
    80003b38:	fd010113          	addi	sp,sp,-48
    80003b3c:	02113423          	sd	ra,40(sp)
    80003b40:	02813023          	sd	s0,32(sp)
    80003b44:	00913c23          	sd	s1,24(sp)
    80003b48:	01213823          	sd	s2,16(sp)
    80003b4c:	01313423          	sd	s3,8(sp)
    80003b50:	03010413          	addi	s0,sp,48
    80003b54:	00050913          	mv	s2,a0
            int i = 0;
    80003b58:	00000993          	li	s3,0
    80003b5c:	0100006f          	j	80003b6c <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
                    Console::putc('\n');
    80003b60:	00a00513          	li	a0,10
    80003b64:	ffffe097          	auipc	ra,0xffffe
    80003b68:	3f0080e7          	jalr	1008(ra) # 80001f54 <_ZN7Console4putcEc>
            while (!threadEnd) {
    80003b6c:	00004797          	auipc	a5,0x4
    80003b70:	c847a783          	lw	a5,-892(a5) # 800077f0 <_ZN19ConsumerProducerCPP9threadEndE>
    80003b74:	04079a63          	bnez	a5,80003bc8 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x90>
                int key = td->buffer->get();
    80003b78:	01093783          	ld	a5,16(s2)
    80003b7c:	0087b503          	ld	a0,8(a5)
    80003b80:	00000097          	auipc	ra,0x0
    80003b84:	958080e7          	jalr	-1704(ra) # 800034d8 <_ZN9BufferCPP3getEv>
                i++;
    80003b88:	0019849b          	addiw	s1,s3,1
    80003b8c:	0004899b          	sext.w	s3,s1
                Console::putc(key);
    80003b90:	0ff57513          	andi	a0,a0,255
    80003b94:	ffffe097          	auipc	ra,0xffffe
    80003b98:	3c0080e7          	jalr	960(ra) # 80001f54 <_ZN7Console4putcEc>
                if (i % 80 == 0) {
    80003b9c:	05000793          	li	a5,80
    80003ba0:	02f4e4bb          	remw	s1,s1,a5
    80003ba4:	fc0494e3          	bnez	s1,80003b6c <_ZN19ConsumerProducerCPP8Consumer3runEv+0x34>
    80003ba8:	fb9ff06f          	j	80003b60 <_ZN19ConsumerProducerCPP8Consumer3runEv+0x28>
                int key = td->buffer->get();
    80003bac:	01093783          	ld	a5,16(s2)
    80003bb0:	0087b503          	ld	a0,8(a5)
    80003bb4:	00000097          	auipc	ra,0x0
    80003bb8:	924080e7          	jalr	-1756(ra) # 800034d8 <_ZN9BufferCPP3getEv>
                Console::putc(key);
    80003bbc:	0ff57513          	andi	a0,a0,255
    80003bc0:	ffffe097          	auipc	ra,0xffffe
    80003bc4:	394080e7          	jalr	916(ra) # 80001f54 <_ZN7Console4putcEc>
            while (td->buffer->getCnt() > 0) {
    80003bc8:	01093783          	ld	a5,16(s2)
    80003bcc:	0087b503          	ld	a0,8(a5)
    80003bd0:	00000097          	auipc	ra,0x0
    80003bd4:	994080e7          	jalr	-1644(ra) # 80003564 <_ZN9BufferCPP6getCntEv>
    80003bd8:	fca04ae3          	bgtz	a0,80003bac <_ZN19ConsumerProducerCPP8Consumer3runEv+0x74>
            td->sem->signal();
    80003bdc:	01093783          	ld	a5,16(s2)
    80003be0:	0107b503          	ld	a0,16(a5)
    80003be4:	ffffe097          	auipc	ra,0xffffe
    80003be8:	2ac080e7          	jalr	684(ra) # 80001e90 <_ZN9Semaphore6signalEv>
        }
    80003bec:	02813083          	ld	ra,40(sp)
    80003bf0:	02013403          	ld	s0,32(sp)
    80003bf4:	01813483          	ld	s1,24(sp)
    80003bf8:	01013903          	ld	s2,16(sp)
    80003bfc:	00813983          	ld	s3,8(sp)
    80003c00:	03010113          	addi	sp,sp,48
    80003c04:	00008067          	ret

0000000080003c08 <_ZN19ConsumerProducerCPP8ConsumerD1Ev>:
    class Consumer : public Thread {
    80003c08:	ff010113          	addi	sp,sp,-16
    80003c0c:	00113423          	sd	ra,8(sp)
    80003c10:	00813023          	sd	s0,0(sp)
    80003c14:	01010413          	addi	s0,sp,16
    80003c18:	00004797          	auipc	a5,0x4
    80003c1c:	aa078793          	addi	a5,a5,-1376 # 800076b8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    80003c20:	00f53023          	sd	a5,0(a0)
    80003c24:	ffffe097          	auipc	ra,0xffffe
    80003c28:	f64080e7          	jalr	-156(ra) # 80001b88 <_ZN6ThreadD1Ev>
    80003c2c:	00813083          	ld	ra,8(sp)
    80003c30:	00013403          	ld	s0,0(sp)
    80003c34:	01010113          	addi	sp,sp,16
    80003c38:	00008067          	ret

0000000080003c3c <_ZN19ConsumerProducerCPP8ConsumerD0Ev>:
    80003c3c:	fe010113          	addi	sp,sp,-32
    80003c40:	00113c23          	sd	ra,24(sp)
    80003c44:	00813823          	sd	s0,16(sp)
    80003c48:	00913423          	sd	s1,8(sp)
    80003c4c:	02010413          	addi	s0,sp,32
    80003c50:	00050493          	mv	s1,a0
    80003c54:	00004797          	auipc	a5,0x4
    80003c58:	a6478793          	addi	a5,a5,-1436 # 800076b8 <_ZTVN19ConsumerProducerCPP8ConsumerE+0x10>
    80003c5c:	00f53023          	sd	a5,0(a0)
    80003c60:	ffffe097          	auipc	ra,0xffffe
    80003c64:	f28080e7          	jalr	-216(ra) # 80001b88 <_ZN6ThreadD1Ev>
    80003c68:	00048513          	mv	a0,s1
    80003c6c:	ffffe097          	auipc	ra,0xffffe
    80003c70:	020080e7          	jalr	32(ra) # 80001c8c <_ZdlPv>
    80003c74:	01813083          	ld	ra,24(sp)
    80003c78:	01013403          	ld	s0,16(sp)
    80003c7c:	00813483          	ld	s1,8(sp)
    80003c80:	02010113          	addi	sp,sp,32
    80003c84:	00008067          	ret

0000000080003c88 <_ZN19ConsumerProducerCPP16ProducerKeyboradD1Ev>:
    class ProducerKeyborad : public Thread {
    80003c88:	ff010113          	addi	sp,sp,-16
    80003c8c:	00113423          	sd	ra,8(sp)
    80003c90:	00813023          	sd	s0,0(sp)
    80003c94:	01010413          	addi	s0,sp,16
    80003c98:	00004797          	auipc	a5,0x4
    80003c9c:	9d078793          	addi	a5,a5,-1584 # 80007668 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80003ca0:	00f53023          	sd	a5,0(a0)
    80003ca4:	ffffe097          	auipc	ra,0xffffe
    80003ca8:	ee4080e7          	jalr	-284(ra) # 80001b88 <_ZN6ThreadD1Ev>
    80003cac:	00813083          	ld	ra,8(sp)
    80003cb0:	00013403          	ld	s0,0(sp)
    80003cb4:	01010113          	addi	sp,sp,16
    80003cb8:	00008067          	ret

0000000080003cbc <_ZN19ConsumerProducerCPP16ProducerKeyboradD0Ev>:
    80003cbc:	fe010113          	addi	sp,sp,-32
    80003cc0:	00113c23          	sd	ra,24(sp)
    80003cc4:	00813823          	sd	s0,16(sp)
    80003cc8:	00913423          	sd	s1,8(sp)
    80003ccc:	02010413          	addi	s0,sp,32
    80003cd0:	00050493          	mv	s1,a0
    80003cd4:	00004797          	auipc	a5,0x4
    80003cd8:	99478793          	addi	a5,a5,-1644 # 80007668 <_ZTVN19ConsumerProducerCPP16ProducerKeyboradE+0x10>
    80003cdc:	00f53023          	sd	a5,0(a0)
    80003ce0:	ffffe097          	auipc	ra,0xffffe
    80003ce4:	ea8080e7          	jalr	-344(ra) # 80001b88 <_ZN6ThreadD1Ev>
    80003ce8:	00048513          	mv	a0,s1
    80003cec:	ffffe097          	auipc	ra,0xffffe
    80003cf0:	fa0080e7          	jalr	-96(ra) # 80001c8c <_ZdlPv>
    80003cf4:	01813083          	ld	ra,24(sp)
    80003cf8:	01013403          	ld	s0,16(sp)
    80003cfc:	00813483          	ld	s1,8(sp)
    80003d00:	02010113          	addi	sp,sp,32
    80003d04:	00008067          	ret

0000000080003d08 <_ZN19ConsumerProducerCPP8ProducerD1Ev>:
    class Producer : public Thread {
    80003d08:	ff010113          	addi	sp,sp,-16
    80003d0c:	00113423          	sd	ra,8(sp)
    80003d10:	00813023          	sd	s0,0(sp)
    80003d14:	01010413          	addi	s0,sp,16
    80003d18:	00004797          	auipc	a5,0x4
    80003d1c:	97878793          	addi	a5,a5,-1672 # 80007690 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    80003d20:	00f53023          	sd	a5,0(a0)
    80003d24:	ffffe097          	auipc	ra,0xffffe
    80003d28:	e64080e7          	jalr	-412(ra) # 80001b88 <_ZN6ThreadD1Ev>
    80003d2c:	00813083          	ld	ra,8(sp)
    80003d30:	00013403          	ld	s0,0(sp)
    80003d34:	01010113          	addi	sp,sp,16
    80003d38:	00008067          	ret

0000000080003d3c <_ZN19ConsumerProducerCPP8ProducerD0Ev>:
    80003d3c:	fe010113          	addi	sp,sp,-32
    80003d40:	00113c23          	sd	ra,24(sp)
    80003d44:	00813823          	sd	s0,16(sp)
    80003d48:	00913423          	sd	s1,8(sp)
    80003d4c:	02010413          	addi	s0,sp,32
    80003d50:	00050493          	mv	s1,a0
    80003d54:	00004797          	auipc	a5,0x4
    80003d58:	93c78793          	addi	a5,a5,-1732 # 80007690 <_ZTVN19ConsumerProducerCPP8ProducerE+0x10>
    80003d5c:	00f53023          	sd	a5,0(a0)
    80003d60:	ffffe097          	auipc	ra,0xffffe
    80003d64:	e28080e7          	jalr	-472(ra) # 80001b88 <_ZN6ThreadD1Ev>
    80003d68:	00048513          	mv	a0,s1
    80003d6c:	ffffe097          	auipc	ra,0xffffe
    80003d70:	f20080e7          	jalr	-224(ra) # 80001c8c <_ZdlPv>
    80003d74:	01813083          	ld	ra,24(sp)
    80003d78:	01013403          	ld	s0,16(sp)
    80003d7c:	00813483          	ld	s1,8(sp)
    80003d80:	02010113          	addi	sp,sp,32
    80003d84:	00008067          	ret

0000000080003d88 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv>:
        void run() override {
    80003d88:	fe010113          	addi	sp,sp,-32
    80003d8c:	00113c23          	sd	ra,24(sp)
    80003d90:	00813823          	sd	s0,16(sp)
    80003d94:	00913423          	sd	s1,8(sp)
    80003d98:	02010413          	addi	s0,sp,32
    80003d9c:	00050493          	mv	s1,a0
            while ((key = getc()) != 0x1b) {
    80003da0:	ffffd097          	auipc	ra,0xffffd
    80003da4:	6d4080e7          	jalr	1748(ra) # 80001474 <_Z4getcv>
    80003da8:	0005059b          	sext.w	a1,a0
    80003dac:	01b00793          	li	a5,27
    80003db0:	00f58c63          	beq	a1,a5,80003dc8 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x40>
                td->buffer->put(key);
    80003db4:	0104b783          	ld	a5,16(s1)
    80003db8:	0087b503          	ld	a0,8(a5)
    80003dbc:	fffff097          	auipc	ra,0xfffff
    80003dc0:	68c080e7          	jalr	1676(ra) # 80003448 <_ZN9BufferCPP3putEi>
            while ((key = getc()) != 0x1b) {
    80003dc4:	fddff06f          	j	80003da0 <_ZN19ConsumerProducerCPP16ProducerKeyborad3runEv+0x18>
            threadEnd = 1;
    80003dc8:	00100793          	li	a5,1
    80003dcc:	00004717          	auipc	a4,0x4
    80003dd0:	a2f72223          	sw	a5,-1500(a4) # 800077f0 <_ZN19ConsumerProducerCPP9threadEndE>
            td->buffer->put('!');
    80003dd4:	0104b783          	ld	a5,16(s1)
    80003dd8:	02100593          	li	a1,33
    80003ddc:	0087b503          	ld	a0,8(a5)
    80003de0:	fffff097          	auipc	ra,0xfffff
    80003de4:	668080e7          	jalr	1640(ra) # 80003448 <_ZN9BufferCPP3putEi>
            td->sem->signal();
    80003de8:	0104b783          	ld	a5,16(s1)
    80003dec:	0107b503          	ld	a0,16(a5)
    80003df0:	ffffe097          	auipc	ra,0xffffe
    80003df4:	0a0080e7          	jalr	160(ra) # 80001e90 <_ZN9Semaphore6signalEv>
        }
    80003df8:	01813083          	ld	ra,24(sp)
    80003dfc:	01013403          	ld	s0,16(sp)
    80003e00:	00813483          	ld	s1,8(sp)
    80003e04:	02010113          	addi	sp,sp,32
    80003e08:	00008067          	ret

0000000080003e0c <_ZN19ConsumerProducerCPP8Producer3runEv>:
        void run() override {
    80003e0c:	fe010113          	addi	sp,sp,-32
    80003e10:	00113c23          	sd	ra,24(sp)
    80003e14:	00813823          	sd	s0,16(sp)
    80003e18:	00913423          	sd	s1,8(sp)
    80003e1c:	01213023          	sd	s2,0(sp)
    80003e20:	02010413          	addi	s0,sp,32
    80003e24:	00050493          	mv	s1,a0
            int i = 0;
    80003e28:	00000913          	li	s2,0
            while (!threadEnd) {
    80003e2c:	00004797          	auipc	a5,0x4
    80003e30:	9c47a783          	lw	a5,-1596(a5) # 800077f0 <_ZN19ConsumerProducerCPP9threadEndE>
    80003e34:	04079263          	bnez	a5,80003e78 <_ZN19ConsumerProducerCPP8Producer3runEv+0x6c>
                td->buffer->put(td->id + '0');
    80003e38:	0104b783          	ld	a5,16(s1)
    80003e3c:	0007a583          	lw	a1,0(a5)
    80003e40:	0305859b          	addiw	a1,a1,48
    80003e44:	0087b503          	ld	a0,8(a5)
    80003e48:	fffff097          	auipc	ra,0xfffff
    80003e4c:	600080e7          	jalr	1536(ra) # 80003448 <_ZN9BufferCPP3putEi>
                i++;
    80003e50:	0019071b          	addiw	a4,s2,1
    80003e54:	0007091b          	sext.w	s2,a4
                Thread::sleep((i+td->id)%5);
    80003e58:	0104b783          	ld	a5,16(s1)
    80003e5c:	0007a783          	lw	a5,0(a5)
    80003e60:	00e787bb          	addw	a5,a5,a4
    80003e64:	00500513          	li	a0,5
    80003e68:	02a7e53b          	remw	a0,a5,a0
    80003e6c:	ffffe097          	auipc	ra,0xffffe
    80003e70:	f64080e7          	jalr	-156(ra) # 80001dd0 <_ZN6Thread5sleepEm>
            while (!threadEnd) {
    80003e74:	fb9ff06f          	j	80003e2c <_ZN19ConsumerProducerCPP8Producer3runEv+0x20>
            td->sem->signal();
    80003e78:	0104b783          	ld	a5,16(s1)
    80003e7c:	0107b503          	ld	a0,16(a5)
    80003e80:	ffffe097          	auipc	ra,0xffffe
    80003e84:	010080e7          	jalr	16(ra) # 80001e90 <_ZN9Semaphore6signalEv>
        }
    80003e88:	01813083          	ld	ra,24(sp)
    80003e8c:	01013403          	ld	s0,16(sp)
    80003e90:	00813483          	ld	s1,8(sp)
    80003e94:	00013903          	ld	s2,0(sp)
    80003e98:	02010113          	addi	sp,sp,32
    80003e9c:	00008067          	ret

0000000080003ea0 <start>:
    80003ea0:	ff010113          	addi	sp,sp,-16
    80003ea4:	00813423          	sd	s0,8(sp)
    80003ea8:	01010413          	addi	s0,sp,16
    80003eac:	300027f3          	csrr	a5,mstatus
    80003eb0:	ffffe737          	lui	a4,0xffffe
    80003eb4:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff5d9f>
    80003eb8:	00e7f7b3          	and	a5,a5,a4
    80003ebc:	00001737          	lui	a4,0x1
    80003ec0:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003ec4:	00e7e7b3          	or	a5,a5,a4
    80003ec8:	30079073          	csrw	mstatus,a5
    80003ecc:	00000797          	auipc	a5,0x0
    80003ed0:	16078793          	addi	a5,a5,352 # 8000402c <system_main>
    80003ed4:	34179073          	csrw	mepc,a5
    80003ed8:	00000793          	li	a5,0
    80003edc:	18079073          	csrw	satp,a5
    80003ee0:	000107b7          	lui	a5,0x10
    80003ee4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003ee8:	30279073          	csrw	medeleg,a5
    80003eec:	30379073          	csrw	mideleg,a5
    80003ef0:	104027f3          	csrr	a5,sie
    80003ef4:	2227e793          	ori	a5,a5,546
    80003ef8:	10479073          	csrw	sie,a5
    80003efc:	fff00793          	li	a5,-1
    80003f00:	00a7d793          	srli	a5,a5,0xa
    80003f04:	3b079073          	csrw	pmpaddr0,a5
    80003f08:	00f00793          	li	a5,15
    80003f0c:	3a079073          	csrw	pmpcfg0,a5
    80003f10:	f14027f3          	csrr	a5,mhartid
    80003f14:	0200c737          	lui	a4,0x200c
    80003f18:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003f1c:	0007869b          	sext.w	a3,a5
    80003f20:	00269713          	slli	a4,a3,0x2
    80003f24:	000f4637          	lui	a2,0xf4
    80003f28:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003f2c:	00d70733          	add	a4,a4,a3
    80003f30:	0037979b          	slliw	a5,a5,0x3
    80003f34:	020046b7          	lui	a3,0x2004
    80003f38:	00d787b3          	add	a5,a5,a3
    80003f3c:	00c585b3          	add	a1,a1,a2
    80003f40:	00371693          	slli	a3,a4,0x3
    80003f44:	00004717          	auipc	a4,0x4
    80003f48:	8bc70713          	addi	a4,a4,-1860 # 80007800 <timer_scratch>
    80003f4c:	00b7b023          	sd	a1,0(a5)
    80003f50:	00d70733          	add	a4,a4,a3
    80003f54:	00f73c23          	sd	a5,24(a4)
    80003f58:	02c73023          	sd	a2,32(a4)
    80003f5c:	34071073          	csrw	mscratch,a4
    80003f60:	00000797          	auipc	a5,0x0
    80003f64:	6e078793          	addi	a5,a5,1760 # 80004640 <timervec>
    80003f68:	30579073          	csrw	mtvec,a5
    80003f6c:	300027f3          	csrr	a5,mstatus
    80003f70:	0087e793          	ori	a5,a5,8
    80003f74:	30079073          	csrw	mstatus,a5
    80003f78:	304027f3          	csrr	a5,mie
    80003f7c:	0807e793          	ori	a5,a5,128
    80003f80:	30479073          	csrw	mie,a5
    80003f84:	f14027f3          	csrr	a5,mhartid
    80003f88:	0007879b          	sext.w	a5,a5
    80003f8c:	00078213          	mv	tp,a5
    80003f90:	30200073          	mret
    80003f94:	00813403          	ld	s0,8(sp)
    80003f98:	01010113          	addi	sp,sp,16
    80003f9c:	00008067          	ret

0000000080003fa0 <timerinit>:
    80003fa0:	ff010113          	addi	sp,sp,-16
    80003fa4:	00813423          	sd	s0,8(sp)
    80003fa8:	01010413          	addi	s0,sp,16
    80003fac:	f14027f3          	csrr	a5,mhartid
    80003fb0:	0200c737          	lui	a4,0x200c
    80003fb4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003fb8:	0007869b          	sext.w	a3,a5
    80003fbc:	00269713          	slli	a4,a3,0x2
    80003fc0:	000f4637          	lui	a2,0xf4
    80003fc4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003fc8:	00d70733          	add	a4,a4,a3
    80003fcc:	0037979b          	slliw	a5,a5,0x3
    80003fd0:	020046b7          	lui	a3,0x2004
    80003fd4:	00d787b3          	add	a5,a5,a3
    80003fd8:	00c585b3          	add	a1,a1,a2
    80003fdc:	00371693          	slli	a3,a4,0x3
    80003fe0:	00004717          	auipc	a4,0x4
    80003fe4:	82070713          	addi	a4,a4,-2016 # 80007800 <timer_scratch>
    80003fe8:	00b7b023          	sd	a1,0(a5)
    80003fec:	00d70733          	add	a4,a4,a3
    80003ff0:	00f73c23          	sd	a5,24(a4)
    80003ff4:	02c73023          	sd	a2,32(a4)
    80003ff8:	34071073          	csrw	mscratch,a4
    80003ffc:	00000797          	auipc	a5,0x0
    80004000:	64478793          	addi	a5,a5,1604 # 80004640 <timervec>
    80004004:	30579073          	csrw	mtvec,a5
    80004008:	300027f3          	csrr	a5,mstatus
    8000400c:	0087e793          	ori	a5,a5,8
    80004010:	30079073          	csrw	mstatus,a5
    80004014:	304027f3          	csrr	a5,mie
    80004018:	0807e793          	ori	a5,a5,128
    8000401c:	30479073          	csrw	mie,a5
    80004020:	00813403          	ld	s0,8(sp)
    80004024:	01010113          	addi	sp,sp,16
    80004028:	00008067          	ret

000000008000402c <system_main>:
    8000402c:	fe010113          	addi	sp,sp,-32
    80004030:	00813823          	sd	s0,16(sp)
    80004034:	00913423          	sd	s1,8(sp)
    80004038:	00113c23          	sd	ra,24(sp)
    8000403c:	02010413          	addi	s0,sp,32
    80004040:	00000097          	auipc	ra,0x0
    80004044:	0c4080e7          	jalr	196(ra) # 80004104 <cpuid>
    80004048:	00003497          	auipc	s1,0x3
    8000404c:	71848493          	addi	s1,s1,1816 # 80007760 <started>
    80004050:	02050263          	beqz	a0,80004074 <system_main+0x48>
    80004054:	0004a783          	lw	a5,0(s1)
    80004058:	0007879b          	sext.w	a5,a5
    8000405c:	fe078ce3          	beqz	a5,80004054 <system_main+0x28>
    80004060:	0ff0000f          	fence
    80004064:	00002517          	auipc	a0,0x2
    80004068:	0ec50513          	addi	a0,a0,236 # 80006150 <CONSOLE_STATUS+0x140>
    8000406c:	00001097          	auipc	ra,0x1
    80004070:	a70080e7          	jalr	-1424(ra) # 80004adc <panic>
    80004074:	00001097          	auipc	ra,0x1
    80004078:	9c4080e7          	jalr	-1596(ra) # 80004a38 <consoleinit>
    8000407c:	00001097          	auipc	ra,0x1
    80004080:	150080e7          	jalr	336(ra) # 800051cc <printfinit>
    80004084:	00002517          	auipc	a0,0x2
    80004088:	fec50513          	addi	a0,a0,-20 # 80006070 <CONSOLE_STATUS+0x60>
    8000408c:	00001097          	auipc	ra,0x1
    80004090:	aac080e7          	jalr	-1364(ra) # 80004b38 <__printf>
    80004094:	00002517          	auipc	a0,0x2
    80004098:	08c50513          	addi	a0,a0,140 # 80006120 <CONSOLE_STATUS+0x110>
    8000409c:	00001097          	auipc	ra,0x1
    800040a0:	a9c080e7          	jalr	-1380(ra) # 80004b38 <__printf>
    800040a4:	00002517          	auipc	a0,0x2
    800040a8:	fcc50513          	addi	a0,a0,-52 # 80006070 <CONSOLE_STATUS+0x60>
    800040ac:	00001097          	auipc	ra,0x1
    800040b0:	a8c080e7          	jalr	-1396(ra) # 80004b38 <__printf>
    800040b4:	00001097          	auipc	ra,0x1
    800040b8:	4a4080e7          	jalr	1188(ra) # 80005558 <kinit>
    800040bc:	00000097          	auipc	ra,0x0
    800040c0:	148080e7          	jalr	328(ra) # 80004204 <trapinit>
    800040c4:	00000097          	auipc	ra,0x0
    800040c8:	16c080e7          	jalr	364(ra) # 80004230 <trapinithart>
    800040cc:	00000097          	auipc	ra,0x0
    800040d0:	5b4080e7          	jalr	1460(ra) # 80004680 <plicinit>
    800040d4:	00000097          	auipc	ra,0x0
    800040d8:	5d4080e7          	jalr	1492(ra) # 800046a8 <plicinithart>
    800040dc:	00000097          	auipc	ra,0x0
    800040e0:	078080e7          	jalr	120(ra) # 80004154 <userinit>
    800040e4:	0ff0000f          	fence
    800040e8:	00100793          	li	a5,1
    800040ec:	00002517          	auipc	a0,0x2
    800040f0:	04c50513          	addi	a0,a0,76 # 80006138 <CONSOLE_STATUS+0x128>
    800040f4:	00f4a023          	sw	a5,0(s1)
    800040f8:	00001097          	auipc	ra,0x1
    800040fc:	a40080e7          	jalr	-1472(ra) # 80004b38 <__printf>
    80004100:	0000006f          	j	80004100 <system_main+0xd4>

0000000080004104 <cpuid>:
    80004104:	ff010113          	addi	sp,sp,-16
    80004108:	00813423          	sd	s0,8(sp)
    8000410c:	01010413          	addi	s0,sp,16
    80004110:	00020513          	mv	a0,tp
    80004114:	00813403          	ld	s0,8(sp)
    80004118:	0005051b          	sext.w	a0,a0
    8000411c:	01010113          	addi	sp,sp,16
    80004120:	00008067          	ret

0000000080004124 <mycpu>:
    80004124:	ff010113          	addi	sp,sp,-16
    80004128:	00813423          	sd	s0,8(sp)
    8000412c:	01010413          	addi	s0,sp,16
    80004130:	00020793          	mv	a5,tp
    80004134:	00813403          	ld	s0,8(sp)
    80004138:	0007879b          	sext.w	a5,a5
    8000413c:	00779793          	slli	a5,a5,0x7
    80004140:	00004517          	auipc	a0,0x4
    80004144:	6f050513          	addi	a0,a0,1776 # 80008830 <cpus>
    80004148:	00f50533          	add	a0,a0,a5
    8000414c:	01010113          	addi	sp,sp,16
    80004150:	00008067          	ret

0000000080004154 <userinit>:
    80004154:	ff010113          	addi	sp,sp,-16
    80004158:	00813423          	sd	s0,8(sp)
    8000415c:	01010413          	addi	s0,sp,16
    80004160:	00813403          	ld	s0,8(sp)
    80004164:	01010113          	addi	sp,sp,16
    80004168:	ffffe317          	auipc	t1,0xffffe
    8000416c:	94c30067          	jr	-1716(t1) # 80001ab4 <main>

0000000080004170 <either_copyout>:
    80004170:	ff010113          	addi	sp,sp,-16
    80004174:	00813023          	sd	s0,0(sp)
    80004178:	00113423          	sd	ra,8(sp)
    8000417c:	01010413          	addi	s0,sp,16
    80004180:	02051663          	bnez	a0,800041ac <either_copyout+0x3c>
    80004184:	00058513          	mv	a0,a1
    80004188:	00060593          	mv	a1,a2
    8000418c:	0006861b          	sext.w	a2,a3
    80004190:	00002097          	auipc	ra,0x2
    80004194:	c54080e7          	jalr	-940(ra) # 80005de4 <__memmove>
    80004198:	00813083          	ld	ra,8(sp)
    8000419c:	00013403          	ld	s0,0(sp)
    800041a0:	00000513          	li	a0,0
    800041a4:	01010113          	addi	sp,sp,16
    800041a8:	00008067          	ret
    800041ac:	00002517          	auipc	a0,0x2
    800041b0:	fcc50513          	addi	a0,a0,-52 # 80006178 <CONSOLE_STATUS+0x168>
    800041b4:	00001097          	auipc	ra,0x1
    800041b8:	928080e7          	jalr	-1752(ra) # 80004adc <panic>

00000000800041bc <either_copyin>:
    800041bc:	ff010113          	addi	sp,sp,-16
    800041c0:	00813023          	sd	s0,0(sp)
    800041c4:	00113423          	sd	ra,8(sp)
    800041c8:	01010413          	addi	s0,sp,16
    800041cc:	02059463          	bnez	a1,800041f4 <either_copyin+0x38>
    800041d0:	00060593          	mv	a1,a2
    800041d4:	0006861b          	sext.w	a2,a3
    800041d8:	00002097          	auipc	ra,0x2
    800041dc:	c0c080e7          	jalr	-1012(ra) # 80005de4 <__memmove>
    800041e0:	00813083          	ld	ra,8(sp)
    800041e4:	00013403          	ld	s0,0(sp)
    800041e8:	00000513          	li	a0,0
    800041ec:	01010113          	addi	sp,sp,16
    800041f0:	00008067          	ret
    800041f4:	00002517          	auipc	a0,0x2
    800041f8:	fac50513          	addi	a0,a0,-84 # 800061a0 <CONSOLE_STATUS+0x190>
    800041fc:	00001097          	auipc	ra,0x1
    80004200:	8e0080e7          	jalr	-1824(ra) # 80004adc <panic>

0000000080004204 <trapinit>:
    80004204:	ff010113          	addi	sp,sp,-16
    80004208:	00813423          	sd	s0,8(sp)
    8000420c:	01010413          	addi	s0,sp,16
    80004210:	00813403          	ld	s0,8(sp)
    80004214:	00002597          	auipc	a1,0x2
    80004218:	fb458593          	addi	a1,a1,-76 # 800061c8 <CONSOLE_STATUS+0x1b8>
    8000421c:	00004517          	auipc	a0,0x4
    80004220:	69450513          	addi	a0,a0,1684 # 800088b0 <tickslock>
    80004224:	01010113          	addi	sp,sp,16
    80004228:	00001317          	auipc	t1,0x1
    8000422c:	5c030067          	jr	1472(t1) # 800057e8 <initlock>

0000000080004230 <trapinithart>:
    80004230:	ff010113          	addi	sp,sp,-16
    80004234:	00813423          	sd	s0,8(sp)
    80004238:	01010413          	addi	s0,sp,16
    8000423c:	00000797          	auipc	a5,0x0
    80004240:	2f478793          	addi	a5,a5,756 # 80004530 <kernelvec>
    80004244:	10579073          	csrw	stvec,a5
    80004248:	00813403          	ld	s0,8(sp)
    8000424c:	01010113          	addi	sp,sp,16
    80004250:	00008067          	ret

0000000080004254 <usertrap>:
    80004254:	ff010113          	addi	sp,sp,-16
    80004258:	00813423          	sd	s0,8(sp)
    8000425c:	01010413          	addi	s0,sp,16
    80004260:	00813403          	ld	s0,8(sp)
    80004264:	01010113          	addi	sp,sp,16
    80004268:	00008067          	ret

000000008000426c <usertrapret>:
    8000426c:	ff010113          	addi	sp,sp,-16
    80004270:	00813423          	sd	s0,8(sp)
    80004274:	01010413          	addi	s0,sp,16
    80004278:	00813403          	ld	s0,8(sp)
    8000427c:	01010113          	addi	sp,sp,16
    80004280:	00008067          	ret

0000000080004284 <kerneltrap>:
    80004284:	fe010113          	addi	sp,sp,-32
    80004288:	00813823          	sd	s0,16(sp)
    8000428c:	00113c23          	sd	ra,24(sp)
    80004290:	00913423          	sd	s1,8(sp)
    80004294:	02010413          	addi	s0,sp,32
    80004298:	142025f3          	csrr	a1,scause
    8000429c:	100027f3          	csrr	a5,sstatus
    800042a0:	0027f793          	andi	a5,a5,2
    800042a4:	10079c63          	bnez	a5,800043bc <kerneltrap+0x138>
    800042a8:	142027f3          	csrr	a5,scause
    800042ac:	0207ce63          	bltz	a5,800042e8 <kerneltrap+0x64>
    800042b0:	00002517          	auipc	a0,0x2
    800042b4:	f6050513          	addi	a0,a0,-160 # 80006210 <CONSOLE_STATUS+0x200>
    800042b8:	00001097          	auipc	ra,0x1
    800042bc:	880080e7          	jalr	-1920(ra) # 80004b38 <__printf>
    800042c0:	141025f3          	csrr	a1,sepc
    800042c4:	14302673          	csrr	a2,stval
    800042c8:	00002517          	auipc	a0,0x2
    800042cc:	f5850513          	addi	a0,a0,-168 # 80006220 <CONSOLE_STATUS+0x210>
    800042d0:	00001097          	auipc	ra,0x1
    800042d4:	868080e7          	jalr	-1944(ra) # 80004b38 <__printf>
    800042d8:	00002517          	auipc	a0,0x2
    800042dc:	f6050513          	addi	a0,a0,-160 # 80006238 <CONSOLE_STATUS+0x228>
    800042e0:	00000097          	auipc	ra,0x0
    800042e4:	7fc080e7          	jalr	2044(ra) # 80004adc <panic>
    800042e8:	0ff7f713          	andi	a4,a5,255
    800042ec:	00900693          	li	a3,9
    800042f0:	04d70063          	beq	a4,a3,80004330 <kerneltrap+0xac>
    800042f4:	fff00713          	li	a4,-1
    800042f8:	03f71713          	slli	a4,a4,0x3f
    800042fc:	00170713          	addi	a4,a4,1
    80004300:	fae798e3          	bne	a5,a4,800042b0 <kerneltrap+0x2c>
    80004304:	00000097          	auipc	ra,0x0
    80004308:	e00080e7          	jalr	-512(ra) # 80004104 <cpuid>
    8000430c:	06050663          	beqz	a0,80004378 <kerneltrap+0xf4>
    80004310:	144027f3          	csrr	a5,sip
    80004314:	ffd7f793          	andi	a5,a5,-3
    80004318:	14479073          	csrw	sip,a5
    8000431c:	01813083          	ld	ra,24(sp)
    80004320:	01013403          	ld	s0,16(sp)
    80004324:	00813483          	ld	s1,8(sp)
    80004328:	02010113          	addi	sp,sp,32
    8000432c:	00008067          	ret
    80004330:	00000097          	auipc	ra,0x0
    80004334:	3c4080e7          	jalr	964(ra) # 800046f4 <plic_claim>
    80004338:	00a00793          	li	a5,10
    8000433c:	00050493          	mv	s1,a0
    80004340:	06f50863          	beq	a0,a5,800043b0 <kerneltrap+0x12c>
    80004344:	fc050ce3          	beqz	a0,8000431c <kerneltrap+0x98>
    80004348:	00050593          	mv	a1,a0
    8000434c:	00002517          	auipc	a0,0x2
    80004350:	ea450513          	addi	a0,a0,-348 # 800061f0 <CONSOLE_STATUS+0x1e0>
    80004354:	00000097          	auipc	ra,0x0
    80004358:	7e4080e7          	jalr	2020(ra) # 80004b38 <__printf>
    8000435c:	01013403          	ld	s0,16(sp)
    80004360:	01813083          	ld	ra,24(sp)
    80004364:	00048513          	mv	a0,s1
    80004368:	00813483          	ld	s1,8(sp)
    8000436c:	02010113          	addi	sp,sp,32
    80004370:	00000317          	auipc	t1,0x0
    80004374:	3bc30067          	jr	956(t1) # 8000472c <plic_complete>
    80004378:	00004517          	auipc	a0,0x4
    8000437c:	53850513          	addi	a0,a0,1336 # 800088b0 <tickslock>
    80004380:	00001097          	auipc	ra,0x1
    80004384:	48c080e7          	jalr	1164(ra) # 8000580c <acquire>
    80004388:	00003717          	auipc	a4,0x3
    8000438c:	3dc70713          	addi	a4,a4,988 # 80007764 <ticks>
    80004390:	00072783          	lw	a5,0(a4)
    80004394:	00004517          	auipc	a0,0x4
    80004398:	51c50513          	addi	a0,a0,1308 # 800088b0 <tickslock>
    8000439c:	0017879b          	addiw	a5,a5,1
    800043a0:	00f72023          	sw	a5,0(a4)
    800043a4:	00001097          	auipc	ra,0x1
    800043a8:	534080e7          	jalr	1332(ra) # 800058d8 <release>
    800043ac:	f65ff06f          	j	80004310 <kerneltrap+0x8c>
    800043b0:	00001097          	auipc	ra,0x1
    800043b4:	090080e7          	jalr	144(ra) # 80005440 <uartintr>
    800043b8:	fa5ff06f          	j	8000435c <kerneltrap+0xd8>
    800043bc:	00002517          	auipc	a0,0x2
    800043c0:	e1450513          	addi	a0,a0,-492 # 800061d0 <CONSOLE_STATUS+0x1c0>
    800043c4:	00000097          	auipc	ra,0x0
    800043c8:	718080e7          	jalr	1816(ra) # 80004adc <panic>

00000000800043cc <clockintr>:
    800043cc:	fe010113          	addi	sp,sp,-32
    800043d0:	00813823          	sd	s0,16(sp)
    800043d4:	00913423          	sd	s1,8(sp)
    800043d8:	00113c23          	sd	ra,24(sp)
    800043dc:	02010413          	addi	s0,sp,32
    800043e0:	00004497          	auipc	s1,0x4
    800043e4:	4d048493          	addi	s1,s1,1232 # 800088b0 <tickslock>
    800043e8:	00048513          	mv	a0,s1
    800043ec:	00001097          	auipc	ra,0x1
    800043f0:	420080e7          	jalr	1056(ra) # 8000580c <acquire>
    800043f4:	00003717          	auipc	a4,0x3
    800043f8:	37070713          	addi	a4,a4,880 # 80007764 <ticks>
    800043fc:	00072783          	lw	a5,0(a4)
    80004400:	01013403          	ld	s0,16(sp)
    80004404:	01813083          	ld	ra,24(sp)
    80004408:	00048513          	mv	a0,s1
    8000440c:	0017879b          	addiw	a5,a5,1
    80004410:	00813483          	ld	s1,8(sp)
    80004414:	00f72023          	sw	a5,0(a4)
    80004418:	02010113          	addi	sp,sp,32
    8000441c:	00001317          	auipc	t1,0x1
    80004420:	4bc30067          	jr	1212(t1) # 800058d8 <release>

0000000080004424 <devintr>:
    80004424:	142027f3          	csrr	a5,scause
    80004428:	00000513          	li	a0,0
    8000442c:	0007c463          	bltz	a5,80004434 <devintr+0x10>
    80004430:	00008067          	ret
    80004434:	fe010113          	addi	sp,sp,-32
    80004438:	00813823          	sd	s0,16(sp)
    8000443c:	00113c23          	sd	ra,24(sp)
    80004440:	00913423          	sd	s1,8(sp)
    80004444:	02010413          	addi	s0,sp,32
    80004448:	0ff7f713          	andi	a4,a5,255
    8000444c:	00900693          	li	a3,9
    80004450:	04d70c63          	beq	a4,a3,800044a8 <devintr+0x84>
    80004454:	fff00713          	li	a4,-1
    80004458:	03f71713          	slli	a4,a4,0x3f
    8000445c:	00170713          	addi	a4,a4,1
    80004460:	00e78c63          	beq	a5,a4,80004478 <devintr+0x54>
    80004464:	01813083          	ld	ra,24(sp)
    80004468:	01013403          	ld	s0,16(sp)
    8000446c:	00813483          	ld	s1,8(sp)
    80004470:	02010113          	addi	sp,sp,32
    80004474:	00008067          	ret
    80004478:	00000097          	auipc	ra,0x0
    8000447c:	c8c080e7          	jalr	-884(ra) # 80004104 <cpuid>
    80004480:	06050663          	beqz	a0,800044ec <devintr+0xc8>
    80004484:	144027f3          	csrr	a5,sip
    80004488:	ffd7f793          	andi	a5,a5,-3
    8000448c:	14479073          	csrw	sip,a5
    80004490:	01813083          	ld	ra,24(sp)
    80004494:	01013403          	ld	s0,16(sp)
    80004498:	00813483          	ld	s1,8(sp)
    8000449c:	00200513          	li	a0,2
    800044a0:	02010113          	addi	sp,sp,32
    800044a4:	00008067          	ret
    800044a8:	00000097          	auipc	ra,0x0
    800044ac:	24c080e7          	jalr	588(ra) # 800046f4 <plic_claim>
    800044b0:	00a00793          	li	a5,10
    800044b4:	00050493          	mv	s1,a0
    800044b8:	06f50663          	beq	a0,a5,80004524 <devintr+0x100>
    800044bc:	00100513          	li	a0,1
    800044c0:	fa0482e3          	beqz	s1,80004464 <devintr+0x40>
    800044c4:	00048593          	mv	a1,s1
    800044c8:	00002517          	auipc	a0,0x2
    800044cc:	d2850513          	addi	a0,a0,-728 # 800061f0 <CONSOLE_STATUS+0x1e0>
    800044d0:	00000097          	auipc	ra,0x0
    800044d4:	668080e7          	jalr	1640(ra) # 80004b38 <__printf>
    800044d8:	00048513          	mv	a0,s1
    800044dc:	00000097          	auipc	ra,0x0
    800044e0:	250080e7          	jalr	592(ra) # 8000472c <plic_complete>
    800044e4:	00100513          	li	a0,1
    800044e8:	f7dff06f          	j	80004464 <devintr+0x40>
    800044ec:	00004517          	auipc	a0,0x4
    800044f0:	3c450513          	addi	a0,a0,964 # 800088b0 <tickslock>
    800044f4:	00001097          	auipc	ra,0x1
    800044f8:	318080e7          	jalr	792(ra) # 8000580c <acquire>
    800044fc:	00003717          	auipc	a4,0x3
    80004500:	26870713          	addi	a4,a4,616 # 80007764 <ticks>
    80004504:	00072783          	lw	a5,0(a4)
    80004508:	00004517          	auipc	a0,0x4
    8000450c:	3a850513          	addi	a0,a0,936 # 800088b0 <tickslock>
    80004510:	0017879b          	addiw	a5,a5,1
    80004514:	00f72023          	sw	a5,0(a4)
    80004518:	00001097          	auipc	ra,0x1
    8000451c:	3c0080e7          	jalr	960(ra) # 800058d8 <release>
    80004520:	f65ff06f          	j	80004484 <devintr+0x60>
    80004524:	00001097          	auipc	ra,0x1
    80004528:	f1c080e7          	jalr	-228(ra) # 80005440 <uartintr>
    8000452c:	fadff06f          	j	800044d8 <devintr+0xb4>

0000000080004530 <kernelvec>:
    80004530:	f0010113          	addi	sp,sp,-256
    80004534:	00113023          	sd	ra,0(sp)
    80004538:	00213423          	sd	sp,8(sp)
    8000453c:	00313823          	sd	gp,16(sp)
    80004540:	00413c23          	sd	tp,24(sp)
    80004544:	02513023          	sd	t0,32(sp)
    80004548:	02613423          	sd	t1,40(sp)
    8000454c:	02713823          	sd	t2,48(sp)
    80004550:	02813c23          	sd	s0,56(sp)
    80004554:	04913023          	sd	s1,64(sp)
    80004558:	04a13423          	sd	a0,72(sp)
    8000455c:	04b13823          	sd	a1,80(sp)
    80004560:	04c13c23          	sd	a2,88(sp)
    80004564:	06d13023          	sd	a3,96(sp)
    80004568:	06e13423          	sd	a4,104(sp)
    8000456c:	06f13823          	sd	a5,112(sp)
    80004570:	07013c23          	sd	a6,120(sp)
    80004574:	09113023          	sd	a7,128(sp)
    80004578:	09213423          	sd	s2,136(sp)
    8000457c:	09313823          	sd	s3,144(sp)
    80004580:	09413c23          	sd	s4,152(sp)
    80004584:	0b513023          	sd	s5,160(sp)
    80004588:	0b613423          	sd	s6,168(sp)
    8000458c:	0b713823          	sd	s7,176(sp)
    80004590:	0b813c23          	sd	s8,184(sp)
    80004594:	0d913023          	sd	s9,192(sp)
    80004598:	0da13423          	sd	s10,200(sp)
    8000459c:	0db13823          	sd	s11,208(sp)
    800045a0:	0dc13c23          	sd	t3,216(sp)
    800045a4:	0fd13023          	sd	t4,224(sp)
    800045a8:	0fe13423          	sd	t5,232(sp)
    800045ac:	0ff13823          	sd	t6,240(sp)
    800045b0:	cd5ff0ef          	jal	ra,80004284 <kerneltrap>
    800045b4:	00013083          	ld	ra,0(sp)
    800045b8:	00813103          	ld	sp,8(sp)
    800045bc:	01013183          	ld	gp,16(sp)
    800045c0:	02013283          	ld	t0,32(sp)
    800045c4:	02813303          	ld	t1,40(sp)
    800045c8:	03013383          	ld	t2,48(sp)
    800045cc:	03813403          	ld	s0,56(sp)
    800045d0:	04013483          	ld	s1,64(sp)
    800045d4:	04813503          	ld	a0,72(sp)
    800045d8:	05013583          	ld	a1,80(sp)
    800045dc:	05813603          	ld	a2,88(sp)
    800045e0:	06013683          	ld	a3,96(sp)
    800045e4:	06813703          	ld	a4,104(sp)
    800045e8:	07013783          	ld	a5,112(sp)
    800045ec:	07813803          	ld	a6,120(sp)
    800045f0:	08013883          	ld	a7,128(sp)
    800045f4:	08813903          	ld	s2,136(sp)
    800045f8:	09013983          	ld	s3,144(sp)
    800045fc:	09813a03          	ld	s4,152(sp)
    80004600:	0a013a83          	ld	s5,160(sp)
    80004604:	0a813b03          	ld	s6,168(sp)
    80004608:	0b013b83          	ld	s7,176(sp)
    8000460c:	0b813c03          	ld	s8,184(sp)
    80004610:	0c013c83          	ld	s9,192(sp)
    80004614:	0c813d03          	ld	s10,200(sp)
    80004618:	0d013d83          	ld	s11,208(sp)
    8000461c:	0d813e03          	ld	t3,216(sp)
    80004620:	0e013e83          	ld	t4,224(sp)
    80004624:	0e813f03          	ld	t5,232(sp)
    80004628:	0f013f83          	ld	t6,240(sp)
    8000462c:	10010113          	addi	sp,sp,256
    80004630:	10200073          	sret
    80004634:	00000013          	nop
    80004638:	00000013          	nop
    8000463c:	00000013          	nop

0000000080004640 <timervec>:
    80004640:	34051573          	csrrw	a0,mscratch,a0
    80004644:	00b53023          	sd	a1,0(a0)
    80004648:	00c53423          	sd	a2,8(a0)
    8000464c:	00d53823          	sd	a3,16(a0)
    80004650:	01853583          	ld	a1,24(a0)
    80004654:	02053603          	ld	a2,32(a0)
    80004658:	0005b683          	ld	a3,0(a1)
    8000465c:	00c686b3          	add	a3,a3,a2
    80004660:	00d5b023          	sd	a3,0(a1)
    80004664:	00200593          	li	a1,2
    80004668:	14459073          	csrw	sip,a1
    8000466c:	01053683          	ld	a3,16(a0)
    80004670:	00853603          	ld	a2,8(a0)
    80004674:	00053583          	ld	a1,0(a0)
    80004678:	34051573          	csrrw	a0,mscratch,a0
    8000467c:	30200073          	mret

0000000080004680 <plicinit>:
    80004680:	ff010113          	addi	sp,sp,-16
    80004684:	00813423          	sd	s0,8(sp)
    80004688:	01010413          	addi	s0,sp,16
    8000468c:	00813403          	ld	s0,8(sp)
    80004690:	0c0007b7          	lui	a5,0xc000
    80004694:	00100713          	li	a4,1
    80004698:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000469c:	00e7a223          	sw	a4,4(a5)
    800046a0:	01010113          	addi	sp,sp,16
    800046a4:	00008067          	ret

00000000800046a8 <plicinithart>:
    800046a8:	ff010113          	addi	sp,sp,-16
    800046ac:	00813023          	sd	s0,0(sp)
    800046b0:	00113423          	sd	ra,8(sp)
    800046b4:	01010413          	addi	s0,sp,16
    800046b8:	00000097          	auipc	ra,0x0
    800046bc:	a4c080e7          	jalr	-1460(ra) # 80004104 <cpuid>
    800046c0:	0085171b          	slliw	a4,a0,0x8
    800046c4:	0c0027b7          	lui	a5,0xc002
    800046c8:	00e787b3          	add	a5,a5,a4
    800046cc:	40200713          	li	a4,1026
    800046d0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800046d4:	00813083          	ld	ra,8(sp)
    800046d8:	00013403          	ld	s0,0(sp)
    800046dc:	00d5151b          	slliw	a0,a0,0xd
    800046e0:	0c2017b7          	lui	a5,0xc201
    800046e4:	00a78533          	add	a0,a5,a0
    800046e8:	00052023          	sw	zero,0(a0)
    800046ec:	01010113          	addi	sp,sp,16
    800046f0:	00008067          	ret

00000000800046f4 <plic_claim>:
    800046f4:	ff010113          	addi	sp,sp,-16
    800046f8:	00813023          	sd	s0,0(sp)
    800046fc:	00113423          	sd	ra,8(sp)
    80004700:	01010413          	addi	s0,sp,16
    80004704:	00000097          	auipc	ra,0x0
    80004708:	a00080e7          	jalr	-1536(ra) # 80004104 <cpuid>
    8000470c:	00813083          	ld	ra,8(sp)
    80004710:	00013403          	ld	s0,0(sp)
    80004714:	00d5151b          	slliw	a0,a0,0xd
    80004718:	0c2017b7          	lui	a5,0xc201
    8000471c:	00a78533          	add	a0,a5,a0
    80004720:	00452503          	lw	a0,4(a0)
    80004724:	01010113          	addi	sp,sp,16
    80004728:	00008067          	ret

000000008000472c <plic_complete>:
    8000472c:	fe010113          	addi	sp,sp,-32
    80004730:	00813823          	sd	s0,16(sp)
    80004734:	00913423          	sd	s1,8(sp)
    80004738:	00113c23          	sd	ra,24(sp)
    8000473c:	02010413          	addi	s0,sp,32
    80004740:	00050493          	mv	s1,a0
    80004744:	00000097          	auipc	ra,0x0
    80004748:	9c0080e7          	jalr	-1600(ra) # 80004104 <cpuid>
    8000474c:	01813083          	ld	ra,24(sp)
    80004750:	01013403          	ld	s0,16(sp)
    80004754:	00d5179b          	slliw	a5,a0,0xd
    80004758:	0c201737          	lui	a4,0xc201
    8000475c:	00f707b3          	add	a5,a4,a5
    80004760:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004764:	00813483          	ld	s1,8(sp)
    80004768:	02010113          	addi	sp,sp,32
    8000476c:	00008067          	ret

0000000080004770 <consolewrite>:
    80004770:	fb010113          	addi	sp,sp,-80
    80004774:	04813023          	sd	s0,64(sp)
    80004778:	04113423          	sd	ra,72(sp)
    8000477c:	02913c23          	sd	s1,56(sp)
    80004780:	03213823          	sd	s2,48(sp)
    80004784:	03313423          	sd	s3,40(sp)
    80004788:	03413023          	sd	s4,32(sp)
    8000478c:	01513c23          	sd	s5,24(sp)
    80004790:	05010413          	addi	s0,sp,80
    80004794:	06c05c63          	blez	a2,8000480c <consolewrite+0x9c>
    80004798:	00060993          	mv	s3,a2
    8000479c:	00050a13          	mv	s4,a0
    800047a0:	00058493          	mv	s1,a1
    800047a4:	00000913          	li	s2,0
    800047a8:	fff00a93          	li	s5,-1
    800047ac:	01c0006f          	j	800047c8 <consolewrite+0x58>
    800047b0:	fbf44503          	lbu	a0,-65(s0)
    800047b4:	0019091b          	addiw	s2,s2,1
    800047b8:	00148493          	addi	s1,s1,1
    800047bc:	00001097          	auipc	ra,0x1
    800047c0:	a9c080e7          	jalr	-1380(ra) # 80005258 <uartputc>
    800047c4:	03298063          	beq	s3,s2,800047e4 <consolewrite+0x74>
    800047c8:	00048613          	mv	a2,s1
    800047cc:	00100693          	li	a3,1
    800047d0:	000a0593          	mv	a1,s4
    800047d4:	fbf40513          	addi	a0,s0,-65
    800047d8:	00000097          	auipc	ra,0x0
    800047dc:	9e4080e7          	jalr	-1564(ra) # 800041bc <either_copyin>
    800047e0:	fd5518e3          	bne	a0,s5,800047b0 <consolewrite+0x40>
    800047e4:	04813083          	ld	ra,72(sp)
    800047e8:	04013403          	ld	s0,64(sp)
    800047ec:	03813483          	ld	s1,56(sp)
    800047f0:	02813983          	ld	s3,40(sp)
    800047f4:	02013a03          	ld	s4,32(sp)
    800047f8:	01813a83          	ld	s5,24(sp)
    800047fc:	00090513          	mv	a0,s2
    80004800:	03013903          	ld	s2,48(sp)
    80004804:	05010113          	addi	sp,sp,80
    80004808:	00008067          	ret
    8000480c:	00000913          	li	s2,0
    80004810:	fd5ff06f          	j	800047e4 <consolewrite+0x74>

0000000080004814 <consoleread>:
    80004814:	f9010113          	addi	sp,sp,-112
    80004818:	06813023          	sd	s0,96(sp)
    8000481c:	04913c23          	sd	s1,88(sp)
    80004820:	05213823          	sd	s2,80(sp)
    80004824:	05313423          	sd	s3,72(sp)
    80004828:	05413023          	sd	s4,64(sp)
    8000482c:	03513c23          	sd	s5,56(sp)
    80004830:	03613823          	sd	s6,48(sp)
    80004834:	03713423          	sd	s7,40(sp)
    80004838:	03813023          	sd	s8,32(sp)
    8000483c:	06113423          	sd	ra,104(sp)
    80004840:	01913c23          	sd	s9,24(sp)
    80004844:	07010413          	addi	s0,sp,112
    80004848:	00060b93          	mv	s7,a2
    8000484c:	00050913          	mv	s2,a0
    80004850:	00058c13          	mv	s8,a1
    80004854:	00060b1b          	sext.w	s6,a2
    80004858:	00004497          	auipc	s1,0x4
    8000485c:	08048493          	addi	s1,s1,128 # 800088d8 <cons>
    80004860:	00400993          	li	s3,4
    80004864:	fff00a13          	li	s4,-1
    80004868:	00a00a93          	li	s5,10
    8000486c:	05705e63          	blez	s7,800048c8 <consoleread+0xb4>
    80004870:	09c4a703          	lw	a4,156(s1)
    80004874:	0984a783          	lw	a5,152(s1)
    80004878:	0007071b          	sext.w	a4,a4
    8000487c:	08e78463          	beq	a5,a4,80004904 <consoleread+0xf0>
    80004880:	07f7f713          	andi	a4,a5,127
    80004884:	00e48733          	add	a4,s1,a4
    80004888:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000488c:	0017869b          	addiw	a3,a5,1
    80004890:	08d4ac23          	sw	a3,152(s1)
    80004894:	00070c9b          	sext.w	s9,a4
    80004898:	0b370663          	beq	a4,s3,80004944 <consoleread+0x130>
    8000489c:	00100693          	li	a3,1
    800048a0:	f9f40613          	addi	a2,s0,-97
    800048a4:	000c0593          	mv	a1,s8
    800048a8:	00090513          	mv	a0,s2
    800048ac:	f8e40fa3          	sb	a4,-97(s0)
    800048b0:	00000097          	auipc	ra,0x0
    800048b4:	8c0080e7          	jalr	-1856(ra) # 80004170 <either_copyout>
    800048b8:	01450863          	beq	a0,s4,800048c8 <consoleread+0xb4>
    800048bc:	001c0c13          	addi	s8,s8,1
    800048c0:	fffb8b9b          	addiw	s7,s7,-1
    800048c4:	fb5c94e3          	bne	s9,s5,8000486c <consoleread+0x58>
    800048c8:	000b851b          	sext.w	a0,s7
    800048cc:	06813083          	ld	ra,104(sp)
    800048d0:	06013403          	ld	s0,96(sp)
    800048d4:	05813483          	ld	s1,88(sp)
    800048d8:	05013903          	ld	s2,80(sp)
    800048dc:	04813983          	ld	s3,72(sp)
    800048e0:	04013a03          	ld	s4,64(sp)
    800048e4:	03813a83          	ld	s5,56(sp)
    800048e8:	02813b83          	ld	s7,40(sp)
    800048ec:	02013c03          	ld	s8,32(sp)
    800048f0:	01813c83          	ld	s9,24(sp)
    800048f4:	40ab053b          	subw	a0,s6,a0
    800048f8:	03013b03          	ld	s6,48(sp)
    800048fc:	07010113          	addi	sp,sp,112
    80004900:	00008067          	ret
    80004904:	00001097          	auipc	ra,0x1
    80004908:	1d8080e7          	jalr	472(ra) # 80005adc <push_on>
    8000490c:	0984a703          	lw	a4,152(s1)
    80004910:	09c4a783          	lw	a5,156(s1)
    80004914:	0007879b          	sext.w	a5,a5
    80004918:	fef70ce3          	beq	a4,a5,80004910 <consoleread+0xfc>
    8000491c:	00001097          	auipc	ra,0x1
    80004920:	234080e7          	jalr	564(ra) # 80005b50 <pop_on>
    80004924:	0984a783          	lw	a5,152(s1)
    80004928:	07f7f713          	andi	a4,a5,127
    8000492c:	00e48733          	add	a4,s1,a4
    80004930:	01874703          	lbu	a4,24(a4)
    80004934:	0017869b          	addiw	a3,a5,1
    80004938:	08d4ac23          	sw	a3,152(s1)
    8000493c:	00070c9b          	sext.w	s9,a4
    80004940:	f5371ee3          	bne	a4,s3,8000489c <consoleread+0x88>
    80004944:	000b851b          	sext.w	a0,s7
    80004948:	f96bf2e3          	bgeu	s7,s6,800048cc <consoleread+0xb8>
    8000494c:	08f4ac23          	sw	a5,152(s1)
    80004950:	f7dff06f          	j	800048cc <consoleread+0xb8>

0000000080004954 <consputc>:
    80004954:	10000793          	li	a5,256
    80004958:	00f50663          	beq	a0,a5,80004964 <consputc+0x10>
    8000495c:	00001317          	auipc	t1,0x1
    80004960:	9f430067          	jr	-1548(t1) # 80005350 <uartputc_sync>
    80004964:	ff010113          	addi	sp,sp,-16
    80004968:	00113423          	sd	ra,8(sp)
    8000496c:	00813023          	sd	s0,0(sp)
    80004970:	01010413          	addi	s0,sp,16
    80004974:	00800513          	li	a0,8
    80004978:	00001097          	auipc	ra,0x1
    8000497c:	9d8080e7          	jalr	-1576(ra) # 80005350 <uartputc_sync>
    80004980:	02000513          	li	a0,32
    80004984:	00001097          	auipc	ra,0x1
    80004988:	9cc080e7          	jalr	-1588(ra) # 80005350 <uartputc_sync>
    8000498c:	00013403          	ld	s0,0(sp)
    80004990:	00813083          	ld	ra,8(sp)
    80004994:	00800513          	li	a0,8
    80004998:	01010113          	addi	sp,sp,16
    8000499c:	00001317          	auipc	t1,0x1
    800049a0:	9b430067          	jr	-1612(t1) # 80005350 <uartputc_sync>

00000000800049a4 <consoleintr>:
    800049a4:	fe010113          	addi	sp,sp,-32
    800049a8:	00813823          	sd	s0,16(sp)
    800049ac:	00913423          	sd	s1,8(sp)
    800049b0:	01213023          	sd	s2,0(sp)
    800049b4:	00113c23          	sd	ra,24(sp)
    800049b8:	02010413          	addi	s0,sp,32
    800049bc:	00004917          	auipc	s2,0x4
    800049c0:	f1c90913          	addi	s2,s2,-228 # 800088d8 <cons>
    800049c4:	00050493          	mv	s1,a0
    800049c8:	00090513          	mv	a0,s2
    800049cc:	00001097          	auipc	ra,0x1
    800049d0:	e40080e7          	jalr	-448(ra) # 8000580c <acquire>
    800049d4:	02048c63          	beqz	s1,80004a0c <consoleintr+0x68>
    800049d8:	0a092783          	lw	a5,160(s2)
    800049dc:	09892703          	lw	a4,152(s2)
    800049e0:	07f00693          	li	a3,127
    800049e4:	40e7873b          	subw	a4,a5,a4
    800049e8:	02e6e263          	bltu	a3,a4,80004a0c <consoleintr+0x68>
    800049ec:	00d00713          	li	a4,13
    800049f0:	04e48063          	beq	s1,a4,80004a30 <consoleintr+0x8c>
    800049f4:	07f7f713          	andi	a4,a5,127
    800049f8:	00e90733          	add	a4,s2,a4
    800049fc:	0017879b          	addiw	a5,a5,1
    80004a00:	0af92023          	sw	a5,160(s2)
    80004a04:	00970c23          	sb	s1,24(a4)
    80004a08:	08f92e23          	sw	a5,156(s2)
    80004a0c:	01013403          	ld	s0,16(sp)
    80004a10:	01813083          	ld	ra,24(sp)
    80004a14:	00813483          	ld	s1,8(sp)
    80004a18:	00013903          	ld	s2,0(sp)
    80004a1c:	00004517          	auipc	a0,0x4
    80004a20:	ebc50513          	addi	a0,a0,-324 # 800088d8 <cons>
    80004a24:	02010113          	addi	sp,sp,32
    80004a28:	00001317          	auipc	t1,0x1
    80004a2c:	eb030067          	jr	-336(t1) # 800058d8 <release>
    80004a30:	00a00493          	li	s1,10
    80004a34:	fc1ff06f          	j	800049f4 <consoleintr+0x50>

0000000080004a38 <consoleinit>:
    80004a38:	fe010113          	addi	sp,sp,-32
    80004a3c:	00113c23          	sd	ra,24(sp)
    80004a40:	00813823          	sd	s0,16(sp)
    80004a44:	00913423          	sd	s1,8(sp)
    80004a48:	02010413          	addi	s0,sp,32
    80004a4c:	00004497          	auipc	s1,0x4
    80004a50:	e8c48493          	addi	s1,s1,-372 # 800088d8 <cons>
    80004a54:	00048513          	mv	a0,s1
    80004a58:	00001597          	auipc	a1,0x1
    80004a5c:	7f058593          	addi	a1,a1,2032 # 80006248 <CONSOLE_STATUS+0x238>
    80004a60:	00001097          	auipc	ra,0x1
    80004a64:	d88080e7          	jalr	-632(ra) # 800057e8 <initlock>
    80004a68:	00000097          	auipc	ra,0x0
    80004a6c:	7ac080e7          	jalr	1964(ra) # 80005214 <uartinit>
    80004a70:	01813083          	ld	ra,24(sp)
    80004a74:	01013403          	ld	s0,16(sp)
    80004a78:	00000797          	auipc	a5,0x0
    80004a7c:	d9c78793          	addi	a5,a5,-612 # 80004814 <consoleread>
    80004a80:	0af4bc23          	sd	a5,184(s1)
    80004a84:	00000797          	auipc	a5,0x0
    80004a88:	cec78793          	addi	a5,a5,-788 # 80004770 <consolewrite>
    80004a8c:	0cf4b023          	sd	a5,192(s1)
    80004a90:	00813483          	ld	s1,8(sp)
    80004a94:	02010113          	addi	sp,sp,32
    80004a98:	00008067          	ret

0000000080004a9c <console_read>:
    80004a9c:	ff010113          	addi	sp,sp,-16
    80004aa0:	00813423          	sd	s0,8(sp)
    80004aa4:	01010413          	addi	s0,sp,16
    80004aa8:	00813403          	ld	s0,8(sp)
    80004aac:	00004317          	auipc	t1,0x4
    80004ab0:	ee433303          	ld	t1,-284(t1) # 80008990 <devsw+0x10>
    80004ab4:	01010113          	addi	sp,sp,16
    80004ab8:	00030067          	jr	t1

0000000080004abc <console_write>:
    80004abc:	ff010113          	addi	sp,sp,-16
    80004ac0:	00813423          	sd	s0,8(sp)
    80004ac4:	01010413          	addi	s0,sp,16
    80004ac8:	00813403          	ld	s0,8(sp)
    80004acc:	00004317          	auipc	t1,0x4
    80004ad0:	ecc33303          	ld	t1,-308(t1) # 80008998 <devsw+0x18>
    80004ad4:	01010113          	addi	sp,sp,16
    80004ad8:	00030067          	jr	t1

0000000080004adc <panic>:
    80004adc:	fe010113          	addi	sp,sp,-32
    80004ae0:	00113c23          	sd	ra,24(sp)
    80004ae4:	00813823          	sd	s0,16(sp)
    80004ae8:	00913423          	sd	s1,8(sp)
    80004aec:	02010413          	addi	s0,sp,32
    80004af0:	00050493          	mv	s1,a0
    80004af4:	00001517          	auipc	a0,0x1
    80004af8:	75c50513          	addi	a0,a0,1884 # 80006250 <CONSOLE_STATUS+0x240>
    80004afc:	00004797          	auipc	a5,0x4
    80004b00:	f207ae23          	sw	zero,-196(a5) # 80008a38 <pr+0x18>
    80004b04:	00000097          	auipc	ra,0x0
    80004b08:	034080e7          	jalr	52(ra) # 80004b38 <__printf>
    80004b0c:	00048513          	mv	a0,s1
    80004b10:	00000097          	auipc	ra,0x0
    80004b14:	028080e7          	jalr	40(ra) # 80004b38 <__printf>
    80004b18:	00001517          	auipc	a0,0x1
    80004b1c:	55850513          	addi	a0,a0,1368 # 80006070 <CONSOLE_STATUS+0x60>
    80004b20:	00000097          	auipc	ra,0x0
    80004b24:	018080e7          	jalr	24(ra) # 80004b38 <__printf>
    80004b28:	00100793          	li	a5,1
    80004b2c:	00003717          	auipc	a4,0x3
    80004b30:	c2f72e23          	sw	a5,-964(a4) # 80007768 <panicked>
    80004b34:	0000006f          	j	80004b34 <panic+0x58>

0000000080004b38 <__printf>:
    80004b38:	f3010113          	addi	sp,sp,-208
    80004b3c:	08813023          	sd	s0,128(sp)
    80004b40:	07313423          	sd	s3,104(sp)
    80004b44:	09010413          	addi	s0,sp,144
    80004b48:	05813023          	sd	s8,64(sp)
    80004b4c:	08113423          	sd	ra,136(sp)
    80004b50:	06913c23          	sd	s1,120(sp)
    80004b54:	07213823          	sd	s2,112(sp)
    80004b58:	07413023          	sd	s4,96(sp)
    80004b5c:	05513c23          	sd	s5,88(sp)
    80004b60:	05613823          	sd	s6,80(sp)
    80004b64:	05713423          	sd	s7,72(sp)
    80004b68:	03913c23          	sd	s9,56(sp)
    80004b6c:	03a13823          	sd	s10,48(sp)
    80004b70:	03b13423          	sd	s11,40(sp)
    80004b74:	00004317          	auipc	t1,0x4
    80004b78:	eac30313          	addi	t1,t1,-340 # 80008a20 <pr>
    80004b7c:	01832c03          	lw	s8,24(t1)
    80004b80:	00b43423          	sd	a1,8(s0)
    80004b84:	00c43823          	sd	a2,16(s0)
    80004b88:	00d43c23          	sd	a3,24(s0)
    80004b8c:	02e43023          	sd	a4,32(s0)
    80004b90:	02f43423          	sd	a5,40(s0)
    80004b94:	03043823          	sd	a6,48(s0)
    80004b98:	03143c23          	sd	a7,56(s0)
    80004b9c:	00050993          	mv	s3,a0
    80004ba0:	4a0c1663          	bnez	s8,8000504c <__printf+0x514>
    80004ba4:	60098c63          	beqz	s3,800051bc <__printf+0x684>
    80004ba8:	0009c503          	lbu	a0,0(s3)
    80004bac:	00840793          	addi	a5,s0,8
    80004bb0:	f6f43c23          	sd	a5,-136(s0)
    80004bb4:	00000493          	li	s1,0
    80004bb8:	22050063          	beqz	a0,80004dd8 <__printf+0x2a0>
    80004bbc:	00002a37          	lui	s4,0x2
    80004bc0:	00018ab7          	lui	s5,0x18
    80004bc4:	000f4b37          	lui	s6,0xf4
    80004bc8:	00989bb7          	lui	s7,0x989
    80004bcc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80004bd0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80004bd4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80004bd8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80004bdc:	00148c9b          	addiw	s9,s1,1
    80004be0:	02500793          	li	a5,37
    80004be4:	01998933          	add	s2,s3,s9
    80004be8:	38f51263          	bne	a0,a5,80004f6c <__printf+0x434>
    80004bec:	00094783          	lbu	a5,0(s2)
    80004bf0:	00078c9b          	sext.w	s9,a5
    80004bf4:	1e078263          	beqz	a5,80004dd8 <__printf+0x2a0>
    80004bf8:	0024849b          	addiw	s1,s1,2
    80004bfc:	07000713          	li	a4,112
    80004c00:	00998933          	add	s2,s3,s1
    80004c04:	38e78a63          	beq	a5,a4,80004f98 <__printf+0x460>
    80004c08:	20f76863          	bltu	a4,a5,80004e18 <__printf+0x2e0>
    80004c0c:	42a78863          	beq	a5,a0,8000503c <__printf+0x504>
    80004c10:	06400713          	li	a4,100
    80004c14:	40e79663          	bne	a5,a4,80005020 <__printf+0x4e8>
    80004c18:	f7843783          	ld	a5,-136(s0)
    80004c1c:	0007a603          	lw	a2,0(a5)
    80004c20:	00878793          	addi	a5,a5,8
    80004c24:	f6f43c23          	sd	a5,-136(s0)
    80004c28:	42064a63          	bltz	a2,8000505c <__printf+0x524>
    80004c2c:	00a00713          	li	a4,10
    80004c30:	02e677bb          	remuw	a5,a2,a4
    80004c34:	00001d97          	auipc	s11,0x1
    80004c38:	644d8d93          	addi	s11,s11,1604 # 80006278 <digits>
    80004c3c:	00900593          	li	a1,9
    80004c40:	0006051b          	sext.w	a0,a2
    80004c44:	00000c93          	li	s9,0
    80004c48:	02079793          	slli	a5,a5,0x20
    80004c4c:	0207d793          	srli	a5,a5,0x20
    80004c50:	00fd87b3          	add	a5,s11,a5
    80004c54:	0007c783          	lbu	a5,0(a5)
    80004c58:	02e656bb          	divuw	a3,a2,a4
    80004c5c:	f8f40023          	sb	a5,-128(s0)
    80004c60:	14c5d863          	bge	a1,a2,80004db0 <__printf+0x278>
    80004c64:	06300593          	li	a1,99
    80004c68:	00100c93          	li	s9,1
    80004c6c:	02e6f7bb          	remuw	a5,a3,a4
    80004c70:	02079793          	slli	a5,a5,0x20
    80004c74:	0207d793          	srli	a5,a5,0x20
    80004c78:	00fd87b3          	add	a5,s11,a5
    80004c7c:	0007c783          	lbu	a5,0(a5)
    80004c80:	02e6d73b          	divuw	a4,a3,a4
    80004c84:	f8f400a3          	sb	a5,-127(s0)
    80004c88:	12a5f463          	bgeu	a1,a0,80004db0 <__printf+0x278>
    80004c8c:	00a00693          	li	a3,10
    80004c90:	00900593          	li	a1,9
    80004c94:	02d777bb          	remuw	a5,a4,a3
    80004c98:	02079793          	slli	a5,a5,0x20
    80004c9c:	0207d793          	srli	a5,a5,0x20
    80004ca0:	00fd87b3          	add	a5,s11,a5
    80004ca4:	0007c503          	lbu	a0,0(a5)
    80004ca8:	02d757bb          	divuw	a5,a4,a3
    80004cac:	f8a40123          	sb	a0,-126(s0)
    80004cb0:	48e5f263          	bgeu	a1,a4,80005134 <__printf+0x5fc>
    80004cb4:	06300513          	li	a0,99
    80004cb8:	02d7f5bb          	remuw	a1,a5,a3
    80004cbc:	02059593          	slli	a1,a1,0x20
    80004cc0:	0205d593          	srli	a1,a1,0x20
    80004cc4:	00bd85b3          	add	a1,s11,a1
    80004cc8:	0005c583          	lbu	a1,0(a1)
    80004ccc:	02d7d7bb          	divuw	a5,a5,a3
    80004cd0:	f8b401a3          	sb	a1,-125(s0)
    80004cd4:	48e57263          	bgeu	a0,a4,80005158 <__printf+0x620>
    80004cd8:	3e700513          	li	a0,999
    80004cdc:	02d7f5bb          	remuw	a1,a5,a3
    80004ce0:	02059593          	slli	a1,a1,0x20
    80004ce4:	0205d593          	srli	a1,a1,0x20
    80004ce8:	00bd85b3          	add	a1,s11,a1
    80004cec:	0005c583          	lbu	a1,0(a1)
    80004cf0:	02d7d7bb          	divuw	a5,a5,a3
    80004cf4:	f8b40223          	sb	a1,-124(s0)
    80004cf8:	46e57663          	bgeu	a0,a4,80005164 <__printf+0x62c>
    80004cfc:	02d7f5bb          	remuw	a1,a5,a3
    80004d00:	02059593          	slli	a1,a1,0x20
    80004d04:	0205d593          	srli	a1,a1,0x20
    80004d08:	00bd85b3          	add	a1,s11,a1
    80004d0c:	0005c583          	lbu	a1,0(a1)
    80004d10:	02d7d7bb          	divuw	a5,a5,a3
    80004d14:	f8b402a3          	sb	a1,-123(s0)
    80004d18:	46ea7863          	bgeu	s4,a4,80005188 <__printf+0x650>
    80004d1c:	02d7f5bb          	remuw	a1,a5,a3
    80004d20:	02059593          	slli	a1,a1,0x20
    80004d24:	0205d593          	srli	a1,a1,0x20
    80004d28:	00bd85b3          	add	a1,s11,a1
    80004d2c:	0005c583          	lbu	a1,0(a1)
    80004d30:	02d7d7bb          	divuw	a5,a5,a3
    80004d34:	f8b40323          	sb	a1,-122(s0)
    80004d38:	3eeaf863          	bgeu	s5,a4,80005128 <__printf+0x5f0>
    80004d3c:	02d7f5bb          	remuw	a1,a5,a3
    80004d40:	02059593          	slli	a1,a1,0x20
    80004d44:	0205d593          	srli	a1,a1,0x20
    80004d48:	00bd85b3          	add	a1,s11,a1
    80004d4c:	0005c583          	lbu	a1,0(a1)
    80004d50:	02d7d7bb          	divuw	a5,a5,a3
    80004d54:	f8b403a3          	sb	a1,-121(s0)
    80004d58:	42eb7e63          	bgeu	s6,a4,80005194 <__printf+0x65c>
    80004d5c:	02d7f5bb          	remuw	a1,a5,a3
    80004d60:	02059593          	slli	a1,a1,0x20
    80004d64:	0205d593          	srli	a1,a1,0x20
    80004d68:	00bd85b3          	add	a1,s11,a1
    80004d6c:	0005c583          	lbu	a1,0(a1)
    80004d70:	02d7d7bb          	divuw	a5,a5,a3
    80004d74:	f8b40423          	sb	a1,-120(s0)
    80004d78:	42ebfc63          	bgeu	s7,a4,800051b0 <__printf+0x678>
    80004d7c:	02079793          	slli	a5,a5,0x20
    80004d80:	0207d793          	srli	a5,a5,0x20
    80004d84:	00fd8db3          	add	s11,s11,a5
    80004d88:	000dc703          	lbu	a4,0(s11)
    80004d8c:	00a00793          	li	a5,10
    80004d90:	00900c93          	li	s9,9
    80004d94:	f8e404a3          	sb	a4,-119(s0)
    80004d98:	00065c63          	bgez	a2,80004db0 <__printf+0x278>
    80004d9c:	f9040713          	addi	a4,s0,-112
    80004da0:	00f70733          	add	a4,a4,a5
    80004da4:	02d00693          	li	a3,45
    80004da8:	fed70823          	sb	a3,-16(a4)
    80004dac:	00078c93          	mv	s9,a5
    80004db0:	f8040793          	addi	a5,s0,-128
    80004db4:	01978cb3          	add	s9,a5,s9
    80004db8:	f7f40d13          	addi	s10,s0,-129
    80004dbc:	000cc503          	lbu	a0,0(s9)
    80004dc0:	fffc8c93          	addi	s9,s9,-1
    80004dc4:	00000097          	auipc	ra,0x0
    80004dc8:	b90080e7          	jalr	-1136(ra) # 80004954 <consputc>
    80004dcc:	ffac98e3          	bne	s9,s10,80004dbc <__printf+0x284>
    80004dd0:	00094503          	lbu	a0,0(s2)
    80004dd4:	e00514e3          	bnez	a0,80004bdc <__printf+0xa4>
    80004dd8:	1a0c1663          	bnez	s8,80004f84 <__printf+0x44c>
    80004ddc:	08813083          	ld	ra,136(sp)
    80004de0:	08013403          	ld	s0,128(sp)
    80004de4:	07813483          	ld	s1,120(sp)
    80004de8:	07013903          	ld	s2,112(sp)
    80004dec:	06813983          	ld	s3,104(sp)
    80004df0:	06013a03          	ld	s4,96(sp)
    80004df4:	05813a83          	ld	s5,88(sp)
    80004df8:	05013b03          	ld	s6,80(sp)
    80004dfc:	04813b83          	ld	s7,72(sp)
    80004e00:	04013c03          	ld	s8,64(sp)
    80004e04:	03813c83          	ld	s9,56(sp)
    80004e08:	03013d03          	ld	s10,48(sp)
    80004e0c:	02813d83          	ld	s11,40(sp)
    80004e10:	0d010113          	addi	sp,sp,208
    80004e14:	00008067          	ret
    80004e18:	07300713          	li	a4,115
    80004e1c:	1ce78a63          	beq	a5,a4,80004ff0 <__printf+0x4b8>
    80004e20:	07800713          	li	a4,120
    80004e24:	1ee79e63          	bne	a5,a4,80005020 <__printf+0x4e8>
    80004e28:	f7843783          	ld	a5,-136(s0)
    80004e2c:	0007a703          	lw	a4,0(a5)
    80004e30:	00878793          	addi	a5,a5,8
    80004e34:	f6f43c23          	sd	a5,-136(s0)
    80004e38:	28074263          	bltz	a4,800050bc <__printf+0x584>
    80004e3c:	00001d97          	auipc	s11,0x1
    80004e40:	43cd8d93          	addi	s11,s11,1084 # 80006278 <digits>
    80004e44:	00f77793          	andi	a5,a4,15
    80004e48:	00fd87b3          	add	a5,s11,a5
    80004e4c:	0007c683          	lbu	a3,0(a5)
    80004e50:	00f00613          	li	a2,15
    80004e54:	0007079b          	sext.w	a5,a4
    80004e58:	f8d40023          	sb	a3,-128(s0)
    80004e5c:	0047559b          	srliw	a1,a4,0x4
    80004e60:	0047569b          	srliw	a3,a4,0x4
    80004e64:	00000c93          	li	s9,0
    80004e68:	0ee65063          	bge	a2,a4,80004f48 <__printf+0x410>
    80004e6c:	00f6f693          	andi	a3,a3,15
    80004e70:	00dd86b3          	add	a3,s11,a3
    80004e74:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004e78:	0087d79b          	srliw	a5,a5,0x8
    80004e7c:	00100c93          	li	s9,1
    80004e80:	f8d400a3          	sb	a3,-127(s0)
    80004e84:	0cb67263          	bgeu	a2,a1,80004f48 <__printf+0x410>
    80004e88:	00f7f693          	andi	a3,a5,15
    80004e8c:	00dd86b3          	add	a3,s11,a3
    80004e90:	0006c583          	lbu	a1,0(a3)
    80004e94:	00f00613          	li	a2,15
    80004e98:	0047d69b          	srliw	a3,a5,0x4
    80004e9c:	f8b40123          	sb	a1,-126(s0)
    80004ea0:	0047d593          	srli	a1,a5,0x4
    80004ea4:	28f67e63          	bgeu	a2,a5,80005140 <__printf+0x608>
    80004ea8:	00f6f693          	andi	a3,a3,15
    80004eac:	00dd86b3          	add	a3,s11,a3
    80004eb0:	0006c503          	lbu	a0,0(a3)
    80004eb4:	0087d813          	srli	a6,a5,0x8
    80004eb8:	0087d69b          	srliw	a3,a5,0x8
    80004ebc:	f8a401a3          	sb	a0,-125(s0)
    80004ec0:	28b67663          	bgeu	a2,a1,8000514c <__printf+0x614>
    80004ec4:	00f6f693          	andi	a3,a3,15
    80004ec8:	00dd86b3          	add	a3,s11,a3
    80004ecc:	0006c583          	lbu	a1,0(a3)
    80004ed0:	00c7d513          	srli	a0,a5,0xc
    80004ed4:	00c7d69b          	srliw	a3,a5,0xc
    80004ed8:	f8b40223          	sb	a1,-124(s0)
    80004edc:	29067a63          	bgeu	a2,a6,80005170 <__printf+0x638>
    80004ee0:	00f6f693          	andi	a3,a3,15
    80004ee4:	00dd86b3          	add	a3,s11,a3
    80004ee8:	0006c583          	lbu	a1,0(a3)
    80004eec:	0107d813          	srli	a6,a5,0x10
    80004ef0:	0107d69b          	srliw	a3,a5,0x10
    80004ef4:	f8b402a3          	sb	a1,-123(s0)
    80004ef8:	28a67263          	bgeu	a2,a0,8000517c <__printf+0x644>
    80004efc:	00f6f693          	andi	a3,a3,15
    80004f00:	00dd86b3          	add	a3,s11,a3
    80004f04:	0006c683          	lbu	a3,0(a3)
    80004f08:	0147d79b          	srliw	a5,a5,0x14
    80004f0c:	f8d40323          	sb	a3,-122(s0)
    80004f10:	21067663          	bgeu	a2,a6,8000511c <__printf+0x5e4>
    80004f14:	02079793          	slli	a5,a5,0x20
    80004f18:	0207d793          	srli	a5,a5,0x20
    80004f1c:	00fd8db3          	add	s11,s11,a5
    80004f20:	000dc683          	lbu	a3,0(s11)
    80004f24:	00800793          	li	a5,8
    80004f28:	00700c93          	li	s9,7
    80004f2c:	f8d403a3          	sb	a3,-121(s0)
    80004f30:	00075c63          	bgez	a4,80004f48 <__printf+0x410>
    80004f34:	f9040713          	addi	a4,s0,-112
    80004f38:	00f70733          	add	a4,a4,a5
    80004f3c:	02d00693          	li	a3,45
    80004f40:	fed70823          	sb	a3,-16(a4)
    80004f44:	00078c93          	mv	s9,a5
    80004f48:	f8040793          	addi	a5,s0,-128
    80004f4c:	01978cb3          	add	s9,a5,s9
    80004f50:	f7f40d13          	addi	s10,s0,-129
    80004f54:	000cc503          	lbu	a0,0(s9)
    80004f58:	fffc8c93          	addi	s9,s9,-1
    80004f5c:	00000097          	auipc	ra,0x0
    80004f60:	9f8080e7          	jalr	-1544(ra) # 80004954 <consputc>
    80004f64:	ff9d18e3          	bne	s10,s9,80004f54 <__printf+0x41c>
    80004f68:	0100006f          	j	80004f78 <__printf+0x440>
    80004f6c:	00000097          	auipc	ra,0x0
    80004f70:	9e8080e7          	jalr	-1560(ra) # 80004954 <consputc>
    80004f74:	000c8493          	mv	s1,s9
    80004f78:	00094503          	lbu	a0,0(s2)
    80004f7c:	c60510e3          	bnez	a0,80004bdc <__printf+0xa4>
    80004f80:	e40c0ee3          	beqz	s8,80004ddc <__printf+0x2a4>
    80004f84:	00004517          	auipc	a0,0x4
    80004f88:	a9c50513          	addi	a0,a0,-1380 # 80008a20 <pr>
    80004f8c:	00001097          	auipc	ra,0x1
    80004f90:	94c080e7          	jalr	-1716(ra) # 800058d8 <release>
    80004f94:	e49ff06f          	j	80004ddc <__printf+0x2a4>
    80004f98:	f7843783          	ld	a5,-136(s0)
    80004f9c:	03000513          	li	a0,48
    80004fa0:	01000d13          	li	s10,16
    80004fa4:	00878713          	addi	a4,a5,8
    80004fa8:	0007bc83          	ld	s9,0(a5)
    80004fac:	f6e43c23          	sd	a4,-136(s0)
    80004fb0:	00000097          	auipc	ra,0x0
    80004fb4:	9a4080e7          	jalr	-1628(ra) # 80004954 <consputc>
    80004fb8:	07800513          	li	a0,120
    80004fbc:	00000097          	auipc	ra,0x0
    80004fc0:	998080e7          	jalr	-1640(ra) # 80004954 <consputc>
    80004fc4:	00001d97          	auipc	s11,0x1
    80004fc8:	2b4d8d93          	addi	s11,s11,692 # 80006278 <digits>
    80004fcc:	03ccd793          	srli	a5,s9,0x3c
    80004fd0:	00fd87b3          	add	a5,s11,a5
    80004fd4:	0007c503          	lbu	a0,0(a5)
    80004fd8:	fffd0d1b          	addiw	s10,s10,-1
    80004fdc:	004c9c93          	slli	s9,s9,0x4
    80004fe0:	00000097          	auipc	ra,0x0
    80004fe4:	974080e7          	jalr	-1676(ra) # 80004954 <consputc>
    80004fe8:	fe0d12e3          	bnez	s10,80004fcc <__printf+0x494>
    80004fec:	f8dff06f          	j	80004f78 <__printf+0x440>
    80004ff0:	f7843783          	ld	a5,-136(s0)
    80004ff4:	0007bc83          	ld	s9,0(a5)
    80004ff8:	00878793          	addi	a5,a5,8
    80004ffc:	f6f43c23          	sd	a5,-136(s0)
    80005000:	000c9a63          	bnez	s9,80005014 <__printf+0x4dc>
    80005004:	1080006f          	j	8000510c <__printf+0x5d4>
    80005008:	001c8c93          	addi	s9,s9,1
    8000500c:	00000097          	auipc	ra,0x0
    80005010:	948080e7          	jalr	-1720(ra) # 80004954 <consputc>
    80005014:	000cc503          	lbu	a0,0(s9)
    80005018:	fe0518e3          	bnez	a0,80005008 <__printf+0x4d0>
    8000501c:	f5dff06f          	j	80004f78 <__printf+0x440>
    80005020:	02500513          	li	a0,37
    80005024:	00000097          	auipc	ra,0x0
    80005028:	930080e7          	jalr	-1744(ra) # 80004954 <consputc>
    8000502c:	000c8513          	mv	a0,s9
    80005030:	00000097          	auipc	ra,0x0
    80005034:	924080e7          	jalr	-1756(ra) # 80004954 <consputc>
    80005038:	f41ff06f          	j	80004f78 <__printf+0x440>
    8000503c:	02500513          	li	a0,37
    80005040:	00000097          	auipc	ra,0x0
    80005044:	914080e7          	jalr	-1772(ra) # 80004954 <consputc>
    80005048:	f31ff06f          	j	80004f78 <__printf+0x440>
    8000504c:	00030513          	mv	a0,t1
    80005050:	00000097          	auipc	ra,0x0
    80005054:	7bc080e7          	jalr	1980(ra) # 8000580c <acquire>
    80005058:	b4dff06f          	j	80004ba4 <__printf+0x6c>
    8000505c:	40c0053b          	negw	a0,a2
    80005060:	00a00713          	li	a4,10
    80005064:	02e576bb          	remuw	a3,a0,a4
    80005068:	00001d97          	auipc	s11,0x1
    8000506c:	210d8d93          	addi	s11,s11,528 # 80006278 <digits>
    80005070:	ff700593          	li	a1,-9
    80005074:	02069693          	slli	a3,a3,0x20
    80005078:	0206d693          	srli	a3,a3,0x20
    8000507c:	00dd86b3          	add	a3,s11,a3
    80005080:	0006c683          	lbu	a3,0(a3)
    80005084:	02e557bb          	divuw	a5,a0,a4
    80005088:	f8d40023          	sb	a3,-128(s0)
    8000508c:	10b65e63          	bge	a2,a1,800051a8 <__printf+0x670>
    80005090:	06300593          	li	a1,99
    80005094:	02e7f6bb          	remuw	a3,a5,a4
    80005098:	02069693          	slli	a3,a3,0x20
    8000509c:	0206d693          	srli	a3,a3,0x20
    800050a0:	00dd86b3          	add	a3,s11,a3
    800050a4:	0006c683          	lbu	a3,0(a3)
    800050a8:	02e7d73b          	divuw	a4,a5,a4
    800050ac:	00200793          	li	a5,2
    800050b0:	f8d400a3          	sb	a3,-127(s0)
    800050b4:	bca5ece3          	bltu	a1,a0,80004c8c <__printf+0x154>
    800050b8:	ce5ff06f          	j	80004d9c <__printf+0x264>
    800050bc:	40e007bb          	negw	a5,a4
    800050c0:	00001d97          	auipc	s11,0x1
    800050c4:	1b8d8d93          	addi	s11,s11,440 # 80006278 <digits>
    800050c8:	00f7f693          	andi	a3,a5,15
    800050cc:	00dd86b3          	add	a3,s11,a3
    800050d0:	0006c583          	lbu	a1,0(a3)
    800050d4:	ff100613          	li	a2,-15
    800050d8:	0047d69b          	srliw	a3,a5,0x4
    800050dc:	f8b40023          	sb	a1,-128(s0)
    800050e0:	0047d59b          	srliw	a1,a5,0x4
    800050e4:	0ac75e63          	bge	a4,a2,800051a0 <__printf+0x668>
    800050e8:	00f6f693          	andi	a3,a3,15
    800050ec:	00dd86b3          	add	a3,s11,a3
    800050f0:	0006c603          	lbu	a2,0(a3)
    800050f4:	00f00693          	li	a3,15
    800050f8:	0087d79b          	srliw	a5,a5,0x8
    800050fc:	f8c400a3          	sb	a2,-127(s0)
    80005100:	d8b6e4e3          	bltu	a3,a1,80004e88 <__printf+0x350>
    80005104:	00200793          	li	a5,2
    80005108:	e2dff06f          	j	80004f34 <__printf+0x3fc>
    8000510c:	00001c97          	auipc	s9,0x1
    80005110:	14cc8c93          	addi	s9,s9,332 # 80006258 <CONSOLE_STATUS+0x248>
    80005114:	02800513          	li	a0,40
    80005118:	ef1ff06f          	j	80005008 <__printf+0x4d0>
    8000511c:	00700793          	li	a5,7
    80005120:	00600c93          	li	s9,6
    80005124:	e0dff06f          	j	80004f30 <__printf+0x3f8>
    80005128:	00700793          	li	a5,7
    8000512c:	00600c93          	li	s9,6
    80005130:	c69ff06f          	j	80004d98 <__printf+0x260>
    80005134:	00300793          	li	a5,3
    80005138:	00200c93          	li	s9,2
    8000513c:	c5dff06f          	j	80004d98 <__printf+0x260>
    80005140:	00300793          	li	a5,3
    80005144:	00200c93          	li	s9,2
    80005148:	de9ff06f          	j	80004f30 <__printf+0x3f8>
    8000514c:	00400793          	li	a5,4
    80005150:	00300c93          	li	s9,3
    80005154:	dddff06f          	j	80004f30 <__printf+0x3f8>
    80005158:	00400793          	li	a5,4
    8000515c:	00300c93          	li	s9,3
    80005160:	c39ff06f          	j	80004d98 <__printf+0x260>
    80005164:	00500793          	li	a5,5
    80005168:	00400c93          	li	s9,4
    8000516c:	c2dff06f          	j	80004d98 <__printf+0x260>
    80005170:	00500793          	li	a5,5
    80005174:	00400c93          	li	s9,4
    80005178:	db9ff06f          	j	80004f30 <__printf+0x3f8>
    8000517c:	00600793          	li	a5,6
    80005180:	00500c93          	li	s9,5
    80005184:	dadff06f          	j	80004f30 <__printf+0x3f8>
    80005188:	00600793          	li	a5,6
    8000518c:	00500c93          	li	s9,5
    80005190:	c09ff06f          	j	80004d98 <__printf+0x260>
    80005194:	00800793          	li	a5,8
    80005198:	00700c93          	li	s9,7
    8000519c:	bfdff06f          	j	80004d98 <__printf+0x260>
    800051a0:	00100793          	li	a5,1
    800051a4:	d91ff06f          	j	80004f34 <__printf+0x3fc>
    800051a8:	00100793          	li	a5,1
    800051ac:	bf1ff06f          	j	80004d9c <__printf+0x264>
    800051b0:	00900793          	li	a5,9
    800051b4:	00800c93          	li	s9,8
    800051b8:	be1ff06f          	j	80004d98 <__printf+0x260>
    800051bc:	00001517          	auipc	a0,0x1
    800051c0:	0a450513          	addi	a0,a0,164 # 80006260 <CONSOLE_STATUS+0x250>
    800051c4:	00000097          	auipc	ra,0x0
    800051c8:	918080e7          	jalr	-1768(ra) # 80004adc <panic>

00000000800051cc <printfinit>:
    800051cc:	fe010113          	addi	sp,sp,-32
    800051d0:	00813823          	sd	s0,16(sp)
    800051d4:	00913423          	sd	s1,8(sp)
    800051d8:	00113c23          	sd	ra,24(sp)
    800051dc:	02010413          	addi	s0,sp,32
    800051e0:	00004497          	auipc	s1,0x4
    800051e4:	84048493          	addi	s1,s1,-1984 # 80008a20 <pr>
    800051e8:	00048513          	mv	a0,s1
    800051ec:	00001597          	auipc	a1,0x1
    800051f0:	08458593          	addi	a1,a1,132 # 80006270 <CONSOLE_STATUS+0x260>
    800051f4:	00000097          	auipc	ra,0x0
    800051f8:	5f4080e7          	jalr	1524(ra) # 800057e8 <initlock>
    800051fc:	01813083          	ld	ra,24(sp)
    80005200:	01013403          	ld	s0,16(sp)
    80005204:	0004ac23          	sw	zero,24(s1)
    80005208:	00813483          	ld	s1,8(sp)
    8000520c:	02010113          	addi	sp,sp,32
    80005210:	00008067          	ret

0000000080005214 <uartinit>:
    80005214:	ff010113          	addi	sp,sp,-16
    80005218:	00813423          	sd	s0,8(sp)
    8000521c:	01010413          	addi	s0,sp,16
    80005220:	100007b7          	lui	a5,0x10000
    80005224:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80005228:	f8000713          	li	a4,-128
    8000522c:	00e781a3          	sb	a4,3(a5)
    80005230:	00300713          	li	a4,3
    80005234:	00e78023          	sb	a4,0(a5)
    80005238:	000780a3          	sb	zero,1(a5)
    8000523c:	00e781a3          	sb	a4,3(a5)
    80005240:	00700693          	li	a3,7
    80005244:	00d78123          	sb	a3,2(a5)
    80005248:	00e780a3          	sb	a4,1(a5)
    8000524c:	00813403          	ld	s0,8(sp)
    80005250:	01010113          	addi	sp,sp,16
    80005254:	00008067          	ret

0000000080005258 <uartputc>:
    80005258:	00002797          	auipc	a5,0x2
    8000525c:	5107a783          	lw	a5,1296(a5) # 80007768 <panicked>
    80005260:	00078463          	beqz	a5,80005268 <uartputc+0x10>
    80005264:	0000006f          	j	80005264 <uartputc+0xc>
    80005268:	fd010113          	addi	sp,sp,-48
    8000526c:	02813023          	sd	s0,32(sp)
    80005270:	00913c23          	sd	s1,24(sp)
    80005274:	01213823          	sd	s2,16(sp)
    80005278:	01313423          	sd	s3,8(sp)
    8000527c:	02113423          	sd	ra,40(sp)
    80005280:	03010413          	addi	s0,sp,48
    80005284:	00002917          	auipc	s2,0x2
    80005288:	4ec90913          	addi	s2,s2,1260 # 80007770 <uart_tx_r>
    8000528c:	00093783          	ld	a5,0(s2)
    80005290:	00002497          	auipc	s1,0x2
    80005294:	4e848493          	addi	s1,s1,1256 # 80007778 <uart_tx_w>
    80005298:	0004b703          	ld	a4,0(s1)
    8000529c:	02078693          	addi	a3,a5,32
    800052a0:	00050993          	mv	s3,a0
    800052a4:	02e69c63          	bne	a3,a4,800052dc <uartputc+0x84>
    800052a8:	00001097          	auipc	ra,0x1
    800052ac:	834080e7          	jalr	-1996(ra) # 80005adc <push_on>
    800052b0:	00093783          	ld	a5,0(s2)
    800052b4:	0004b703          	ld	a4,0(s1)
    800052b8:	02078793          	addi	a5,a5,32
    800052bc:	00e79463          	bne	a5,a4,800052c4 <uartputc+0x6c>
    800052c0:	0000006f          	j	800052c0 <uartputc+0x68>
    800052c4:	00001097          	auipc	ra,0x1
    800052c8:	88c080e7          	jalr	-1908(ra) # 80005b50 <pop_on>
    800052cc:	00093783          	ld	a5,0(s2)
    800052d0:	0004b703          	ld	a4,0(s1)
    800052d4:	02078693          	addi	a3,a5,32
    800052d8:	fce688e3          	beq	a3,a4,800052a8 <uartputc+0x50>
    800052dc:	01f77693          	andi	a3,a4,31
    800052e0:	00003597          	auipc	a1,0x3
    800052e4:	76058593          	addi	a1,a1,1888 # 80008a40 <uart_tx_buf>
    800052e8:	00d586b3          	add	a3,a1,a3
    800052ec:	00170713          	addi	a4,a4,1
    800052f0:	01368023          	sb	s3,0(a3)
    800052f4:	00e4b023          	sd	a4,0(s1)
    800052f8:	10000637          	lui	a2,0x10000
    800052fc:	02f71063          	bne	a4,a5,8000531c <uartputc+0xc4>
    80005300:	0340006f          	j	80005334 <uartputc+0xdc>
    80005304:	00074703          	lbu	a4,0(a4)
    80005308:	00f93023          	sd	a5,0(s2)
    8000530c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80005310:	00093783          	ld	a5,0(s2)
    80005314:	0004b703          	ld	a4,0(s1)
    80005318:	00f70e63          	beq	a4,a5,80005334 <uartputc+0xdc>
    8000531c:	00564683          	lbu	a3,5(a2)
    80005320:	01f7f713          	andi	a4,a5,31
    80005324:	00e58733          	add	a4,a1,a4
    80005328:	0206f693          	andi	a3,a3,32
    8000532c:	00178793          	addi	a5,a5,1
    80005330:	fc069ae3          	bnez	a3,80005304 <uartputc+0xac>
    80005334:	02813083          	ld	ra,40(sp)
    80005338:	02013403          	ld	s0,32(sp)
    8000533c:	01813483          	ld	s1,24(sp)
    80005340:	01013903          	ld	s2,16(sp)
    80005344:	00813983          	ld	s3,8(sp)
    80005348:	03010113          	addi	sp,sp,48
    8000534c:	00008067          	ret

0000000080005350 <uartputc_sync>:
    80005350:	ff010113          	addi	sp,sp,-16
    80005354:	00813423          	sd	s0,8(sp)
    80005358:	01010413          	addi	s0,sp,16
    8000535c:	00002717          	auipc	a4,0x2
    80005360:	40c72703          	lw	a4,1036(a4) # 80007768 <panicked>
    80005364:	02071663          	bnez	a4,80005390 <uartputc_sync+0x40>
    80005368:	00050793          	mv	a5,a0
    8000536c:	100006b7          	lui	a3,0x10000
    80005370:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80005374:	02077713          	andi	a4,a4,32
    80005378:	fe070ce3          	beqz	a4,80005370 <uartputc_sync+0x20>
    8000537c:	0ff7f793          	andi	a5,a5,255
    80005380:	00f68023          	sb	a5,0(a3)
    80005384:	00813403          	ld	s0,8(sp)
    80005388:	01010113          	addi	sp,sp,16
    8000538c:	00008067          	ret
    80005390:	0000006f          	j	80005390 <uartputc_sync+0x40>

0000000080005394 <uartstart>:
    80005394:	ff010113          	addi	sp,sp,-16
    80005398:	00813423          	sd	s0,8(sp)
    8000539c:	01010413          	addi	s0,sp,16
    800053a0:	00002617          	auipc	a2,0x2
    800053a4:	3d060613          	addi	a2,a2,976 # 80007770 <uart_tx_r>
    800053a8:	00002517          	auipc	a0,0x2
    800053ac:	3d050513          	addi	a0,a0,976 # 80007778 <uart_tx_w>
    800053b0:	00063783          	ld	a5,0(a2)
    800053b4:	00053703          	ld	a4,0(a0)
    800053b8:	04f70263          	beq	a4,a5,800053fc <uartstart+0x68>
    800053bc:	100005b7          	lui	a1,0x10000
    800053c0:	00003817          	auipc	a6,0x3
    800053c4:	68080813          	addi	a6,a6,1664 # 80008a40 <uart_tx_buf>
    800053c8:	01c0006f          	j	800053e4 <uartstart+0x50>
    800053cc:	0006c703          	lbu	a4,0(a3)
    800053d0:	00f63023          	sd	a5,0(a2)
    800053d4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800053d8:	00063783          	ld	a5,0(a2)
    800053dc:	00053703          	ld	a4,0(a0)
    800053e0:	00f70e63          	beq	a4,a5,800053fc <uartstart+0x68>
    800053e4:	01f7f713          	andi	a4,a5,31
    800053e8:	00e806b3          	add	a3,a6,a4
    800053ec:	0055c703          	lbu	a4,5(a1)
    800053f0:	00178793          	addi	a5,a5,1
    800053f4:	02077713          	andi	a4,a4,32
    800053f8:	fc071ae3          	bnez	a4,800053cc <uartstart+0x38>
    800053fc:	00813403          	ld	s0,8(sp)
    80005400:	01010113          	addi	sp,sp,16
    80005404:	00008067          	ret

0000000080005408 <uartgetc>:
    80005408:	ff010113          	addi	sp,sp,-16
    8000540c:	00813423          	sd	s0,8(sp)
    80005410:	01010413          	addi	s0,sp,16
    80005414:	10000737          	lui	a4,0x10000
    80005418:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000541c:	0017f793          	andi	a5,a5,1
    80005420:	00078c63          	beqz	a5,80005438 <uartgetc+0x30>
    80005424:	00074503          	lbu	a0,0(a4)
    80005428:	0ff57513          	andi	a0,a0,255
    8000542c:	00813403          	ld	s0,8(sp)
    80005430:	01010113          	addi	sp,sp,16
    80005434:	00008067          	ret
    80005438:	fff00513          	li	a0,-1
    8000543c:	ff1ff06f          	j	8000542c <uartgetc+0x24>

0000000080005440 <uartintr>:
    80005440:	100007b7          	lui	a5,0x10000
    80005444:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80005448:	0017f793          	andi	a5,a5,1
    8000544c:	0a078463          	beqz	a5,800054f4 <uartintr+0xb4>
    80005450:	fe010113          	addi	sp,sp,-32
    80005454:	00813823          	sd	s0,16(sp)
    80005458:	00913423          	sd	s1,8(sp)
    8000545c:	00113c23          	sd	ra,24(sp)
    80005460:	02010413          	addi	s0,sp,32
    80005464:	100004b7          	lui	s1,0x10000
    80005468:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000546c:	0ff57513          	andi	a0,a0,255
    80005470:	fffff097          	auipc	ra,0xfffff
    80005474:	534080e7          	jalr	1332(ra) # 800049a4 <consoleintr>
    80005478:	0054c783          	lbu	a5,5(s1)
    8000547c:	0017f793          	andi	a5,a5,1
    80005480:	fe0794e3          	bnez	a5,80005468 <uartintr+0x28>
    80005484:	00002617          	auipc	a2,0x2
    80005488:	2ec60613          	addi	a2,a2,748 # 80007770 <uart_tx_r>
    8000548c:	00002517          	auipc	a0,0x2
    80005490:	2ec50513          	addi	a0,a0,748 # 80007778 <uart_tx_w>
    80005494:	00063783          	ld	a5,0(a2)
    80005498:	00053703          	ld	a4,0(a0)
    8000549c:	04f70263          	beq	a4,a5,800054e0 <uartintr+0xa0>
    800054a0:	100005b7          	lui	a1,0x10000
    800054a4:	00003817          	auipc	a6,0x3
    800054a8:	59c80813          	addi	a6,a6,1436 # 80008a40 <uart_tx_buf>
    800054ac:	01c0006f          	j	800054c8 <uartintr+0x88>
    800054b0:	0006c703          	lbu	a4,0(a3)
    800054b4:	00f63023          	sd	a5,0(a2)
    800054b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800054bc:	00063783          	ld	a5,0(a2)
    800054c0:	00053703          	ld	a4,0(a0)
    800054c4:	00f70e63          	beq	a4,a5,800054e0 <uartintr+0xa0>
    800054c8:	01f7f713          	andi	a4,a5,31
    800054cc:	00e806b3          	add	a3,a6,a4
    800054d0:	0055c703          	lbu	a4,5(a1)
    800054d4:	00178793          	addi	a5,a5,1
    800054d8:	02077713          	andi	a4,a4,32
    800054dc:	fc071ae3          	bnez	a4,800054b0 <uartintr+0x70>
    800054e0:	01813083          	ld	ra,24(sp)
    800054e4:	01013403          	ld	s0,16(sp)
    800054e8:	00813483          	ld	s1,8(sp)
    800054ec:	02010113          	addi	sp,sp,32
    800054f0:	00008067          	ret
    800054f4:	00002617          	auipc	a2,0x2
    800054f8:	27c60613          	addi	a2,a2,636 # 80007770 <uart_tx_r>
    800054fc:	00002517          	auipc	a0,0x2
    80005500:	27c50513          	addi	a0,a0,636 # 80007778 <uart_tx_w>
    80005504:	00063783          	ld	a5,0(a2)
    80005508:	00053703          	ld	a4,0(a0)
    8000550c:	04f70263          	beq	a4,a5,80005550 <uartintr+0x110>
    80005510:	100005b7          	lui	a1,0x10000
    80005514:	00003817          	auipc	a6,0x3
    80005518:	52c80813          	addi	a6,a6,1324 # 80008a40 <uart_tx_buf>
    8000551c:	01c0006f          	j	80005538 <uartintr+0xf8>
    80005520:	0006c703          	lbu	a4,0(a3)
    80005524:	00f63023          	sd	a5,0(a2)
    80005528:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000552c:	00063783          	ld	a5,0(a2)
    80005530:	00053703          	ld	a4,0(a0)
    80005534:	02f70063          	beq	a4,a5,80005554 <uartintr+0x114>
    80005538:	01f7f713          	andi	a4,a5,31
    8000553c:	00e806b3          	add	a3,a6,a4
    80005540:	0055c703          	lbu	a4,5(a1)
    80005544:	00178793          	addi	a5,a5,1
    80005548:	02077713          	andi	a4,a4,32
    8000554c:	fc071ae3          	bnez	a4,80005520 <uartintr+0xe0>
    80005550:	00008067          	ret
    80005554:	00008067          	ret

0000000080005558 <kinit>:
    80005558:	fc010113          	addi	sp,sp,-64
    8000555c:	02913423          	sd	s1,40(sp)
    80005560:	fffff7b7          	lui	a5,0xfffff
    80005564:	00004497          	auipc	s1,0x4
    80005568:	4fb48493          	addi	s1,s1,1275 # 80009a5f <end+0xfff>
    8000556c:	02813823          	sd	s0,48(sp)
    80005570:	01313c23          	sd	s3,24(sp)
    80005574:	00f4f4b3          	and	s1,s1,a5
    80005578:	02113c23          	sd	ra,56(sp)
    8000557c:	03213023          	sd	s2,32(sp)
    80005580:	01413823          	sd	s4,16(sp)
    80005584:	01513423          	sd	s5,8(sp)
    80005588:	04010413          	addi	s0,sp,64
    8000558c:	000017b7          	lui	a5,0x1
    80005590:	01100993          	li	s3,17
    80005594:	00f487b3          	add	a5,s1,a5
    80005598:	01b99993          	slli	s3,s3,0x1b
    8000559c:	06f9e063          	bltu	s3,a5,800055fc <kinit+0xa4>
    800055a0:	00003a97          	auipc	s5,0x3
    800055a4:	4c0a8a93          	addi	s5,s5,1216 # 80008a60 <end>
    800055a8:	0754ec63          	bltu	s1,s5,80005620 <kinit+0xc8>
    800055ac:	0734fa63          	bgeu	s1,s3,80005620 <kinit+0xc8>
    800055b0:	00088a37          	lui	s4,0x88
    800055b4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800055b8:	00002917          	auipc	s2,0x2
    800055bc:	1c890913          	addi	s2,s2,456 # 80007780 <kmem>
    800055c0:	00ca1a13          	slli	s4,s4,0xc
    800055c4:	0140006f          	j	800055d8 <kinit+0x80>
    800055c8:	000017b7          	lui	a5,0x1
    800055cc:	00f484b3          	add	s1,s1,a5
    800055d0:	0554e863          	bltu	s1,s5,80005620 <kinit+0xc8>
    800055d4:	0534f663          	bgeu	s1,s3,80005620 <kinit+0xc8>
    800055d8:	00001637          	lui	a2,0x1
    800055dc:	00100593          	li	a1,1
    800055e0:	00048513          	mv	a0,s1
    800055e4:	00000097          	auipc	ra,0x0
    800055e8:	5e4080e7          	jalr	1508(ra) # 80005bc8 <__memset>
    800055ec:	00093783          	ld	a5,0(s2)
    800055f0:	00f4b023          	sd	a5,0(s1)
    800055f4:	00993023          	sd	s1,0(s2)
    800055f8:	fd4498e3          	bne	s1,s4,800055c8 <kinit+0x70>
    800055fc:	03813083          	ld	ra,56(sp)
    80005600:	03013403          	ld	s0,48(sp)
    80005604:	02813483          	ld	s1,40(sp)
    80005608:	02013903          	ld	s2,32(sp)
    8000560c:	01813983          	ld	s3,24(sp)
    80005610:	01013a03          	ld	s4,16(sp)
    80005614:	00813a83          	ld	s5,8(sp)
    80005618:	04010113          	addi	sp,sp,64
    8000561c:	00008067          	ret
    80005620:	00001517          	auipc	a0,0x1
    80005624:	c7050513          	addi	a0,a0,-912 # 80006290 <digits+0x18>
    80005628:	fffff097          	auipc	ra,0xfffff
    8000562c:	4b4080e7          	jalr	1204(ra) # 80004adc <panic>

0000000080005630 <freerange>:
    80005630:	fc010113          	addi	sp,sp,-64
    80005634:	000017b7          	lui	a5,0x1
    80005638:	02913423          	sd	s1,40(sp)
    8000563c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80005640:	009504b3          	add	s1,a0,s1
    80005644:	fffff537          	lui	a0,0xfffff
    80005648:	02813823          	sd	s0,48(sp)
    8000564c:	02113c23          	sd	ra,56(sp)
    80005650:	03213023          	sd	s2,32(sp)
    80005654:	01313c23          	sd	s3,24(sp)
    80005658:	01413823          	sd	s4,16(sp)
    8000565c:	01513423          	sd	s5,8(sp)
    80005660:	01613023          	sd	s6,0(sp)
    80005664:	04010413          	addi	s0,sp,64
    80005668:	00a4f4b3          	and	s1,s1,a0
    8000566c:	00f487b3          	add	a5,s1,a5
    80005670:	06f5e463          	bltu	a1,a5,800056d8 <freerange+0xa8>
    80005674:	00003a97          	auipc	s5,0x3
    80005678:	3eca8a93          	addi	s5,s5,1004 # 80008a60 <end>
    8000567c:	0954e263          	bltu	s1,s5,80005700 <freerange+0xd0>
    80005680:	01100993          	li	s3,17
    80005684:	01b99993          	slli	s3,s3,0x1b
    80005688:	0734fc63          	bgeu	s1,s3,80005700 <freerange+0xd0>
    8000568c:	00058a13          	mv	s4,a1
    80005690:	00002917          	auipc	s2,0x2
    80005694:	0f090913          	addi	s2,s2,240 # 80007780 <kmem>
    80005698:	00002b37          	lui	s6,0x2
    8000569c:	0140006f          	j	800056b0 <freerange+0x80>
    800056a0:	000017b7          	lui	a5,0x1
    800056a4:	00f484b3          	add	s1,s1,a5
    800056a8:	0554ec63          	bltu	s1,s5,80005700 <freerange+0xd0>
    800056ac:	0534fa63          	bgeu	s1,s3,80005700 <freerange+0xd0>
    800056b0:	00001637          	lui	a2,0x1
    800056b4:	00100593          	li	a1,1
    800056b8:	00048513          	mv	a0,s1
    800056bc:	00000097          	auipc	ra,0x0
    800056c0:	50c080e7          	jalr	1292(ra) # 80005bc8 <__memset>
    800056c4:	00093703          	ld	a4,0(s2)
    800056c8:	016487b3          	add	a5,s1,s6
    800056cc:	00e4b023          	sd	a4,0(s1)
    800056d0:	00993023          	sd	s1,0(s2)
    800056d4:	fcfa76e3          	bgeu	s4,a5,800056a0 <freerange+0x70>
    800056d8:	03813083          	ld	ra,56(sp)
    800056dc:	03013403          	ld	s0,48(sp)
    800056e0:	02813483          	ld	s1,40(sp)
    800056e4:	02013903          	ld	s2,32(sp)
    800056e8:	01813983          	ld	s3,24(sp)
    800056ec:	01013a03          	ld	s4,16(sp)
    800056f0:	00813a83          	ld	s5,8(sp)
    800056f4:	00013b03          	ld	s6,0(sp)
    800056f8:	04010113          	addi	sp,sp,64
    800056fc:	00008067          	ret
    80005700:	00001517          	auipc	a0,0x1
    80005704:	b9050513          	addi	a0,a0,-1136 # 80006290 <digits+0x18>
    80005708:	fffff097          	auipc	ra,0xfffff
    8000570c:	3d4080e7          	jalr	980(ra) # 80004adc <panic>

0000000080005710 <kfree>:
    80005710:	fe010113          	addi	sp,sp,-32
    80005714:	00813823          	sd	s0,16(sp)
    80005718:	00113c23          	sd	ra,24(sp)
    8000571c:	00913423          	sd	s1,8(sp)
    80005720:	02010413          	addi	s0,sp,32
    80005724:	03451793          	slli	a5,a0,0x34
    80005728:	04079c63          	bnez	a5,80005780 <kfree+0x70>
    8000572c:	00003797          	auipc	a5,0x3
    80005730:	33478793          	addi	a5,a5,820 # 80008a60 <end>
    80005734:	00050493          	mv	s1,a0
    80005738:	04f56463          	bltu	a0,a5,80005780 <kfree+0x70>
    8000573c:	01100793          	li	a5,17
    80005740:	01b79793          	slli	a5,a5,0x1b
    80005744:	02f57e63          	bgeu	a0,a5,80005780 <kfree+0x70>
    80005748:	00001637          	lui	a2,0x1
    8000574c:	00100593          	li	a1,1
    80005750:	00000097          	auipc	ra,0x0
    80005754:	478080e7          	jalr	1144(ra) # 80005bc8 <__memset>
    80005758:	00002797          	auipc	a5,0x2
    8000575c:	02878793          	addi	a5,a5,40 # 80007780 <kmem>
    80005760:	0007b703          	ld	a4,0(a5)
    80005764:	01813083          	ld	ra,24(sp)
    80005768:	01013403          	ld	s0,16(sp)
    8000576c:	00e4b023          	sd	a4,0(s1)
    80005770:	0097b023          	sd	s1,0(a5)
    80005774:	00813483          	ld	s1,8(sp)
    80005778:	02010113          	addi	sp,sp,32
    8000577c:	00008067          	ret
    80005780:	00001517          	auipc	a0,0x1
    80005784:	b1050513          	addi	a0,a0,-1264 # 80006290 <digits+0x18>
    80005788:	fffff097          	auipc	ra,0xfffff
    8000578c:	354080e7          	jalr	852(ra) # 80004adc <panic>

0000000080005790 <kalloc>:
    80005790:	fe010113          	addi	sp,sp,-32
    80005794:	00813823          	sd	s0,16(sp)
    80005798:	00913423          	sd	s1,8(sp)
    8000579c:	00113c23          	sd	ra,24(sp)
    800057a0:	02010413          	addi	s0,sp,32
    800057a4:	00002797          	auipc	a5,0x2
    800057a8:	fdc78793          	addi	a5,a5,-36 # 80007780 <kmem>
    800057ac:	0007b483          	ld	s1,0(a5)
    800057b0:	02048063          	beqz	s1,800057d0 <kalloc+0x40>
    800057b4:	0004b703          	ld	a4,0(s1)
    800057b8:	00001637          	lui	a2,0x1
    800057bc:	00500593          	li	a1,5
    800057c0:	00048513          	mv	a0,s1
    800057c4:	00e7b023          	sd	a4,0(a5)
    800057c8:	00000097          	auipc	ra,0x0
    800057cc:	400080e7          	jalr	1024(ra) # 80005bc8 <__memset>
    800057d0:	01813083          	ld	ra,24(sp)
    800057d4:	01013403          	ld	s0,16(sp)
    800057d8:	00048513          	mv	a0,s1
    800057dc:	00813483          	ld	s1,8(sp)
    800057e0:	02010113          	addi	sp,sp,32
    800057e4:	00008067          	ret

00000000800057e8 <initlock>:
    800057e8:	ff010113          	addi	sp,sp,-16
    800057ec:	00813423          	sd	s0,8(sp)
    800057f0:	01010413          	addi	s0,sp,16
    800057f4:	00813403          	ld	s0,8(sp)
    800057f8:	00b53423          	sd	a1,8(a0)
    800057fc:	00052023          	sw	zero,0(a0)
    80005800:	00053823          	sd	zero,16(a0)
    80005804:	01010113          	addi	sp,sp,16
    80005808:	00008067          	ret

000000008000580c <acquire>:
    8000580c:	fe010113          	addi	sp,sp,-32
    80005810:	00813823          	sd	s0,16(sp)
    80005814:	00913423          	sd	s1,8(sp)
    80005818:	00113c23          	sd	ra,24(sp)
    8000581c:	01213023          	sd	s2,0(sp)
    80005820:	02010413          	addi	s0,sp,32
    80005824:	00050493          	mv	s1,a0
    80005828:	10002973          	csrr	s2,sstatus
    8000582c:	100027f3          	csrr	a5,sstatus
    80005830:	ffd7f793          	andi	a5,a5,-3
    80005834:	10079073          	csrw	sstatus,a5
    80005838:	fffff097          	auipc	ra,0xfffff
    8000583c:	8ec080e7          	jalr	-1812(ra) # 80004124 <mycpu>
    80005840:	07852783          	lw	a5,120(a0)
    80005844:	06078e63          	beqz	a5,800058c0 <acquire+0xb4>
    80005848:	fffff097          	auipc	ra,0xfffff
    8000584c:	8dc080e7          	jalr	-1828(ra) # 80004124 <mycpu>
    80005850:	07852783          	lw	a5,120(a0)
    80005854:	0004a703          	lw	a4,0(s1)
    80005858:	0017879b          	addiw	a5,a5,1
    8000585c:	06f52c23          	sw	a5,120(a0)
    80005860:	04071063          	bnez	a4,800058a0 <acquire+0x94>
    80005864:	00100713          	li	a4,1
    80005868:	00070793          	mv	a5,a4
    8000586c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005870:	0007879b          	sext.w	a5,a5
    80005874:	fe079ae3          	bnez	a5,80005868 <acquire+0x5c>
    80005878:	0ff0000f          	fence
    8000587c:	fffff097          	auipc	ra,0xfffff
    80005880:	8a8080e7          	jalr	-1880(ra) # 80004124 <mycpu>
    80005884:	01813083          	ld	ra,24(sp)
    80005888:	01013403          	ld	s0,16(sp)
    8000588c:	00a4b823          	sd	a0,16(s1)
    80005890:	00013903          	ld	s2,0(sp)
    80005894:	00813483          	ld	s1,8(sp)
    80005898:	02010113          	addi	sp,sp,32
    8000589c:	00008067          	ret
    800058a0:	0104b903          	ld	s2,16(s1)
    800058a4:	fffff097          	auipc	ra,0xfffff
    800058a8:	880080e7          	jalr	-1920(ra) # 80004124 <mycpu>
    800058ac:	faa91ce3          	bne	s2,a0,80005864 <acquire+0x58>
    800058b0:	00001517          	auipc	a0,0x1
    800058b4:	9e850513          	addi	a0,a0,-1560 # 80006298 <digits+0x20>
    800058b8:	fffff097          	auipc	ra,0xfffff
    800058bc:	224080e7          	jalr	548(ra) # 80004adc <panic>
    800058c0:	00195913          	srli	s2,s2,0x1
    800058c4:	fffff097          	auipc	ra,0xfffff
    800058c8:	860080e7          	jalr	-1952(ra) # 80004124 <mycpu>
    800058cc:	00197913          	andi	s2,s2,1
    800058d0:	07252e23          	sw	s2,124(a0)
    800058d4:	f75ff06f          	j	80005848 <acquire+0x3c>

00000000800058d8 <release>:
    800058d8:	fe010113          	addi	sp,sp,-32
    800058dc:	00813823          	sd	s0,16(sp)
    800058e0:	00113c23          	sd	ra,24(sp)
    800058e4:	00913423          	sd	s1,8(sp)
    800058e8:	01213023          	sd	s2,0(sp)
    800058ec:	02010413          	addi	s0,sp,32
    800058f0:	00052783          	lw	a5,0(a0)
    800058f4:	00079a63          	bnez	a5,80005908 <release+0x30>
    800058f8:	00001517          	auipc	a0,0x1
    800058fc:	9a850513          	addi	a0,a0,-1624 # 800062a0 <digits+0x28>
    80005900:	fffff097          	auipc	ra,0xfffff
    80005904:	1dc080e7          	jalr	476(ra) # 80004adc <panic>
    80005908:	01053903          	ld	s2,16(a0)
    8000590c:	00050493          	mv	s1,a0
    80005910:	fffff097          	auipc	ra,0xfffff
    80005914:	814080e7          	jalr	-2028(ra) # 80004124 <mycpu>
    80005918:	fea910e3          	bne	s2,a0,800058f8 <release+0x20>
    8000591c:	0004b823          	sd	zero,16(s1)
    80005920:	0ff0000f          	fence
    80005924:	0f50000f          	fence	iorw,ow
    80005928:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000592c:	ffffe097          	auipc	ra,0xffffe
    80005930:	7f8080e7          	jalr	2040(ra) # 80004124 <mycpu>
    80005934:	100027f3          	csrr	a5,sstatus
    80005938:	0027f793          	andi	a5,a5,2
    8000593c:	04079a63          	bnez	a5,80005990 <release+0xb8>
    80005940:	07852783          	lw	a5,120(a0)
    80005944:	02f05e63          	blez	a5,80005980 <release+0xa8>
    80005948:	fff7871b          	addiw	a4,a5,-1
    8000594c:	06e52c23          	sw	a4,120(a0)
    80005950:	00071c63          	bnez	a4,80005968 <release+0x90>
    80005954:	07c52783          	lw	a5,124(a0)
    80005958:	00078863          	beqz	a5,80005968 <release+0x90>
    8000595c:	100027f3          	csrr	a5,sstatus
    80005960:	0027e793          	ori	a5,a5,2
    80005964:	10079073          	csrw	sstatus,a5
    80005968:	01813083          	ld	ra,24(sp)
    8000596c:	01013403          	ld	s0,16(sp)
    80005970:	00813483          	ld	s1,8(sp)
    80005974:	00013903          	ld	s2,0(sp)
    80005978:	02010113          	addi	sp,sp,32
    8000597c:	00008067          	ret
    80005980:	00001517          	auipc	a0,0x1
    80005984:	94050513          	addi	a0,a0,-1728 # 800062c0 <digits+0x48>
    80005988:	fffff097          	auipc	ra,0xfffff
    8000598c:	154080e7          	jalr	340(ra) # 80004adc <panic>
    80005990:	00001517          	auipc	a0,0x1
    80005994:	91850513          	addi	a0,a0,-1768 # 800062a8 <digits+0x30>
    80005998:	fffff097          	auipc	ra,0xfffff
    8000599c:	144080e7          	jalr	324(ra) # 80004adc <panic>

00000000800059a0 <holding>:
    800059a0:	00052783          	lw	a5,0(a0)
    800059a4:	00079663          	bnez	a5,800059b0 <holding+0x10>
    800059a8:	00000513          	li	a0,0
    800059ac:	00008067          	ret
    800059b0:	fe010113          	addi	sp,sp,-32
    800059b4:	00813823          	sd	s0,16(sp)
    800059b8:	00913423          	sd	s1,8(sp)
    800059bc:	00113c23          	sd	ra,24(sp)
    800059c0:	02010413          	addi	s0,sp,32
    800059c4:	01053483          	ld	s1,16(a0)
    800059c8:	ffffe097          	auipc	ra,0xffffe
    800059cc:	75c080e7          	jalr	1884(ra) # 80004124 <mycpu>
    800059d0:	01813083          	ld	ra,24(sp)
    800059d4:	01013403          	ld	s0,16(sp)
    800059d8:	40a48533          	sub	a0,s1,a0
    800059dc:	00153513          	seqz	a0,a0
    800059e0:	00813483          	ld	s1,8(sp)
    800059e4:	02010113          	addi	sp,sp,32
    800059e8:	00008067          	ret

00000000800059ec <push_off>:
    800059ec:	fe010113          	addi	sp,sp,-32
    800059f0:	00813823          	sd	s0,16(sp)
    800059f4:	00113c23          	sd	ra,24(sp)
    800059f8:	00913423          	sd	s1,8(sp)
    800059fc:	02010413          	addi	s0,sp,32
    80005a00:	100024f3          	csrr	s1,sstatus
    80005a04:	100027f3          	csrr	a5,sstatus
    80005a08:	ffd7f793          	andi	a5,a5,-3
    80005a0c:	10079073          	csrw	sstatus,a5
    80005a10:	ffffe097          	auipc	ra,0xffffe
    80005a14:	714080e7          	jalr	1812(ra) # 80004124 <mycpu>
    80005a18:	07852783          	lw	a5,120(a0)
    80005a1c:	02078663          	beqz	a5,80005a48 <push_off+0x5c>
    80005a20:	ffffe097          	auipc	ra,0xffffe
    80005a24:	704080e7          	jalr	1796(ra) # 80004124 <mycpu>
    80005a28:	07852783          	lw	a5,120(a0)
    80005a2c:	01813083          	ld	ra,24(sp)
    80005a30:	01013403          	ld	s0,16(sp)
    80005a34:	0017879b          	addiw	a5,a5,1
    80005a38:	06f52c23          	sw	a5,120(a0)
    80005a3c:	00813483          	ld	s1,8(sp)
    80005a40:	02010113          	addi	sp,sp,32
    80005a44:	00008067          	ret
    80005a48:	0014d493          	srli	s1,s1,0x1
    80005a4c:	ffffe097          	auipc	ra,0xffffe
    80005a50:	6d8080e7          	jalr	1752(ra) # 80004124 <mycpu>
    80005a54:	0014f493          	andi	s1,s1,1
    80005a58:	06952e23          	sw	s1,124(a0)
    80005a5c:	fc5ff06f          	j	80005a20 <push_off+0x34>

0000000080005a60 <pop_off>:
    80005a60:	ff010113          	addi	sp,sp,-16
    80005a64:	00813023          	sd	s0,0(sp)
    80005a68:	00113423          	sd	ra,8(sp)
    80005a6c:	01010413          	addi	s0,sp,16
    80005a70:	ffffe097          	auipc	ra,0xffffe
    80005a74:	6b4080e7          	jalr	1716(ra) # 80004124 <mycpu>
    80005a78:	100027f3          	csrr	a5,sstatus
    80005a7c:	0027f793          	andi	a5,a5,2
    80005a80:	04079663          	bnez	a5,80005acc <pop_off+0x6c>
    80005a84:	07852783          	lw	a5,120(a0)
    80005a88:	02f05a63          	blez	a5,80005abc <pop_off+0x5c>
    80005a8c:	fff7871b          	addiw	a4,a5,-1
    80005a90:	06e52c23          	sw	a4,120(a0)
    80005a94:	00071c63          	bnez	a4,80005aac <pop_off+0x4c>
    80005a98:	07c52783          	lw	a5,124(a0)
    80005a9c:	00078863          	beqz	a5,80005aac <pop_off+0x4c>
    80005aa0:	100027f3          	csrr	a5,sstatus
    80005aa4:	0027e793          	ori	a5,a5,2
    80005aa8:	10079073          	csrw	sstatus,a5
    80005aac:	00813083          	ld	ra,8(sp)
    80005ab0:	00013403          	ld	s0,0(sp)
    80005ab4:	01010113          	addi	sp,sp,16
    80005ab8:	00008067          	ret
    80005abc:	00001517          	auipc	a0,0x1
    80005ac0:	80450513          	addi	a0,a0,-2044 # 800062c0 <digits+0x48>
    80005ac4:	fffff097          	auipc	ra,0xfffff
    80005ac8:	018080e7          	jalr	24(ra) # 80004adc <panic>
    80005acc:	00000517          	auipc	a0,0x0
    80005ad0:	7dc50513          	addi	a0,a0,2012 # 800062a8 <digits+0x30>
    80005ad4:	fffff097          	auipc	ra,0xfffff
    80005ad8:	008080e7          	jalr	8(ra) # 80004adc <panic>

0000000080005adc <push_on>:
    80005adc:	fe010113          	addi	sp,sp,-32
    80005ae0:	00813823          	sd	s0,16(sp)
    80005ae4:	00113c23          	sd	ra,24(sp)
    80005ae8:	00913423          	sd	s1,8(sp)
    80005aec:	02010413          	addi	s0,sp,32
    80005af0:	100024f3          	csrr	s1,sstatus
    80005af4:	100027f3          	csrr	a5,sstatus
    80005af8:	0027e793          	ori	a5,a5,2
    80005afc:	10079073          	csrw	sstatus,a5
    80005b00:	ffffe097          	auipc	ra,0xffffe
    80005b04:	624080e7          	jalr	1572(ra) # 80004124 <mycpu>
    80005b08:	07852783          	lw	a5,120(a0)
    80005b0c:	02078663          	beqz	a5,80005b38 <push_on+0x5c>
    80005b10:	ffffe097          	auipc	ra,0xffffe
    80005b14:	614080e7          	jalr	1556(ra) # 80004124 <mycpu>
    80005b18:	07852783          	lw	a5,120(a0)
    80005b1c:	01813083          	ld	ra,24(sp)
    80005b20:	01013403          	ld	s0,16(sp)
    80005b24:	0017879b          	addiw	a5,a5,1
    80005b28:	06f52c23          	sw	a5,120(a0)
    80005b2c:	00813483          	ld	s1,8(sp)
    80005b30:	02010113          	addi	sp,sp,32
    80005b34:	00008067          	ret
    80005b38:	0014d493          	srli	s1,s1,0x1
    80005b3c:	ffffe097          	auipc	ra,0xffffe
    80005b40:	5e8080e7          	jalr	1512(ra) # 80004124 <mycpu>
    80005b44:	0014f493          	andi	s1,s1,1
    80005b48:	06952e23          	sw	s1,124(a0)
    80005b4c:	fc5ff06f          	j	80005b10 <push_on+0x34>

0000000080005b50 <pop_on>:
    80005b50:	ff010113          	addi	sp,sp,-16
    80005b54:	00813023          	sd	s0,0(sp)
    80005b58:	00113423          	sd	ra,8(sp)
    80005b5c:	01010413          	addi	s0,sp,16
    80005b60:	ffffe097          	auipc	ra,0xffffe
    80005b64:	5c4080e7          	jalr	1476(ra) # 80004124 <mycpu>
    80005b68:	100027f3          	csrr	a5,sstatus
    80005b6c:	0027f793          	andi	a5,a5,2
    80005b70:	04078463          	beqz	a5,80005bb8 <pop_on+0x68>
    80005b74:	07852783          	lw	a5,120(a0)
    80005b78:	02f05863          	blez	a5,80005ba8 <pop_on+0x58>
    80005b7c:	fff7879b          	addiw	a5,a5,-1
    80005b80:	06f52c23          	sw	a5,120(a0)
    80005b84:	07853783          	ld	a5,120(a0)
    80005b88:	00079863          	bnez	a5,80005b98 <pop_on+0x48>
    80005b8c:	100027f3          	csrr	a5,sstatus
    80005b90:	ffd7f793          	andi	a5,a5,-3
    80005b94:	10079073          	csrw	sstatus,a5
    80005b98:	00813083          	ld	ra,8(sp)
    80005b9c:	00013403          	ld	s0,0(sp)
    80005ba0:	01010113          	addi	sp,sp,16
    80005ba4:	00008067          	ret
    80005ba8:	00000517          	auipc	a0,0x0
    80005bac:	74050513          	addi	a0,a0,1856 # 800062e8 <digits+0x70>
    80005bb0:	fffff097          	auipc	ra,0xfffff
    80005bb4:	f2c080e7          	jalr	-212(ra) # 80004adc <panic>
    80005bb8:	00000517          	auipc	a0,0x0
    80005bbc:	71050513          	addi	a0,a0,1808 # 800062c8 <digits+0x50>
    80005bc0:	fffff097          	auipc	ra,0xfffff
    80005bc4:	f1c080e7          	jalr	-228(ra) # 80004adc <panic>

0000000080005bc8 <__memset>:
    80005bc8:	ff010113          	addi	sp,sp,-16
    80005bcc:	00813423          	sd	s0,8(sp)
    80005bd0:	01010413          	addi	s0,sp,16
    80005bd4:	1a060e63          	beqz	a2,80005d90 <__memset+0x1c8>
    80005bd8:	40a007b3          	neg	a5,a0
    80005bdc:	0077f793          	andi	a5,a5,7
    80005be0:	00778693          	addi	a3,a5,7
    80005be4:	00b00813          	li	a6,11
    80005be8:	0ff5f593          	andi	a1,a1,255
    80005bec:	fff6071b          	addiw	a4,a2,-1
    80005bf0:	1b06e663          	bltu	a3,a6,80005d9c <__memset+0x1d4>
    80005bf4:	1cd76463          	bltu	a4,a3,80005dbc <__memset+0x1f4>
    80005bf8:	1a078e63          	beqz	a5,80005db4 <__memset+0x1ec>
    80005bfc:	00b50023          	sb	a1,0(a0)
    80005c00:	00100713          	li	a4,1
    80005c04:	1ae78463          	beq	a5,a4,80005dac <__memset+0x1e4>
    80005c08:	00b500a3          	sb	a1,1(a0)
    80005c0c:	00200713          	li	a4,2
    80005c10:	1ae78a63          	beq	a5,a4,80005dc4 <__memset+0x1fc>
    80005c14:	00b50123          	sb	a1,2(a0)
    80005c18:	00300713          	li	a4,3
    80005c1c:	18e78463          	beq	a5,a4,80005da4 <__memset+0x1dc>
    80005c20:	00b501a3          	sb	a1,3(a0)
    80005c24:	00400713          	li	a4,4
    80005c28:	1ae78263          	beq	a5,a4,80005dcc <__memset+0x204>
    80005c2c:	00b50223          	sb	a1,4(a0)
    80005c30:	00500713          	li	a4,5
    80005c34:	1ae78063          	beq	a5,a4,80005dd4 <__memset+0x20c>
    80005c38:	00b502a3          	sb	a1,5(a0)
    80005c3c:	00700713          	li	a4,7
    80005c40:	18e79e63          	bne	a5,a4,80005ddc <__memset+0x214>
    80005c44:	00b50323          	sb	a1,6(a0)
    80005c48:	00700e93          	li	t4,7
    80005c4c:	00859713          	slli	a4,a1,0x8
    80005c50:	00e5e733          	or	a4,a1,a4
    80005c54:	01059e13          	slli	t3,a1,0x10
    80005c58:	01c76e33          	or	t3,a4,t3
    80005c5c:	01859313          	slli	t1,a1,0x18
    80005c60:	006e6333          	or	t1,t3,t1
    80005c64:	02059893          	slli	a7,a1,0x20
    80005c68:	40f60e3b          	subw	t3,a2,a5
    80005c6c:	011368b3          	or	a7,t1,a7
    80005c70:	02859813          	slli	a6,a1,0x28
    80005c74:	0108e833          	or	a6,a7,a6
    80005c78:	03059693          	slli	a3,a1,0x30
    80005c7c:	003e589b          	srliw	a7,t3,0x3
    80005c80:	00d866b3          	or	a3,a6,a3
    80005c84:	03859713          	slli	a4,a1,0x38
    80005c88:	00389813          	slli	a6,a7,0x3
    80005c8c:	00f507b3          	add	a5,a0,a5
    80005c90:	00e6e733          	or	a4,a3,a4
    80005c94:	000e089b          	sext.w	a7,t3
    80005c98:	00f806b3          	add	a3,a6,a5
    80005c9c:	00e7b023          	sd	a4,0(a5)
    80005ca0:	00878793          	addi	a5,a5,8
    80005ca4:	fed79ce3          	bne	a5,a3,80005c9c <__memset+0xd4>
    80005ca8:	ff8e7793          	andi	a5,t3,-8
    80005cac:	0007871b          	sext.w	a4,a5
    80005cb0:	01d787bb          	addw	a5,a5,t4
    80005cb4:	0ce88e63          	beq	a7,a4,80005d90 <__memset+0x1c8>
    80005cb8:	00f50733          	add	a4,a0,a5
    80005cbc:	00b70023          	sb	a1,0(a4)
    80005cc0:	0017871b          	addiw	a4,a5,1
    80005cc4:	0cc77663          	bgeu	a4,a2,80005d90 <__memset+0x1c8>
    80005cc8:	00e50733          	add	a4,a0,a4
    80005ccc:	00b70023          	sb	a1,0(a4)
    80005cd0:	0027871b          	addiw	a4,a5,2
    80005cd4:	0ac77e63          	bgeu	a4,a2,80005d90 <__memset+0x1c8>
    80005cd8:	00e50733          	add	a4,a0,a4
    80005cdc:	00b70023          	sb	a1,0(a4)
    80005ce0:	0037871b          	addiw	a4,a5,3
    80005ce4:	0ac77663          	bgeu	a4,a2,80005d90 <__memset+0x1c8>
    80005ce8:	00e50733          	add	a4,a0,a4
    80005cec:	00b70023          	sb	a1,0(a4)
    80005cf0:	0047871b          	addiw	a4,a5,4
    80005cf4:	08c77e63          	bgeu	a4,a2,80005d90 <__memset+0x1c8>
    80005cf8:	00e50733          	add	a4,a0,a4
    80005cfc:	00b70023          	sb	a1,0(a4)
    80005d00:	0057871b          	addiw	a4,a5,5
    80005d04:	08c77663          	bgeu	a4,a2,80005d90 <__memset+0x1c8>
    80005d08:	00e50733          	add	a4,a0,a4
    80005d0c:	00b70023          	sb	a1,0(a4)
    80005d10:	0067871b          	addiw	a4,a5,6
    80005d14:	06c77e63          	bgeu	a4,a2,80005d90 <__memset+0x1c8>
    80005d18:	00e50733          	add	a4,a0,a4
    80005d1c:	00b70023          	sb	a1,0(a4)
    80005d20:	0077871b          	addiw	a4,a5,7
    80005d24:	06c77663          	bgeu	a4,a2,80005d90 <__memset+0x1c8>
    80005d28:	00e50733          	add	a4,a0,a4
    80005d2c:	00b70023          	sb	a1,0(a4)
    80005d30:	0087871b          	addiw	a4,a5,8
    80005d34:	04c77e63          	bgeu	a4,a2,80005d90 <__memset+0x1c8>
    80005d38:	00e50733          	add	a4,a0,a4
    80005d3c:	00b70023          	sb	a1,0(a4)
    80005d40:	0097871b          	addiw	a4,a5,9
    80005d44:	04c77663          	bgeu	a4,a2,80005d90 <__memset+0x1c8>
    80005d48:	00e50733          	add	a4,a0,a4
    80005d4c:	00b70023          	sb	a1,0(a4)
    80005d50:	00a7871b          	addiw	a4,a5,10
    80005d54:	02c77e63          	bgeu	a4,a2,80005d90 <__memset+0x1c8>
    80005d58:	00e50733          	add	a4,a0,a4
    80005d5c:	00b70023          	sb	a1,0(a4)
    80005d60:	00b7871b          	addiw	a4,a5,11
    80005d64:	02c77663          	bgeu	a4,a2,80005d90 <__memset+0x1c8>
    80005d68:	00e50733          	add	a4,a0,a4
    80005d6c:	00b70023          	sb	a1,0(a4)
    80005d70:	00c7871b          	addiw	a4,a5,12
    80005d74:	00c77e63          	bgeu	a4,a2,80005d90 <__memset+0x1c8>
    80005d78:	00e50733          	add	a4,a0,a4
    80005d7c:	00b70023          	sb	a1,0(a4)
    80005d80:	00d7879b          	addiw	a5,a5,13
    80005d84:	00c7f663          	bgeu	a5,a2,80005d90 <__memset+0x1c8>
    80005d88:	00f507b3          	add	a5,a0,a5
    80005d8c:	00b78023          	sb	a1,0(a5)
    80005d90:	00813403          	ld	s0,8(sp)
    80005d94:	01010113          	addi	sp,sp,16
    80005d98:	00008067          	ret
    80005d9c:	00b00693          	li	a3,11
    80005da0:	e55ff06f          	j	80005bf4 <__memset+0x2c>
    80005da4:	00300e93          	li	t4,3
    80005da8:	ea5ff06f          	j	80005c4c <__memset+0x84>
    80005dac:	00100e93          	li	t4,1
    80005db0:	e9dff06f          	j	80005c4c <__memset+0x84>
    80005db4:	00000e93          	li	t4,0
    80005db8:	e95ff06f          	j	80005c4c <__memset+0x84>
    80005dbc:	00000793          	li	a5,0
    80005dc0:	ef9ff06f          	j	80005cb8 <__memset+0xf0>
    80005dc4:	00200e93          	li	t4,2
    80005dc8:	e85ff06f          	j	80005c4c <__memset+0x84>
    80005dcc:	00400e93          	li	t4,4
    80005dd0:	e7dff06f          	j	80005c4c <__memset+0x84>
    80005dd4:	00500e93          	li	t4,5
    80005dd8:	e75ff06f          	j	80005c4c <__memset+0x84>
    80005ddc:	00600e93          	li	t4,6
    80005de0:	e6dff06f          	j	80005c4c <__memset+0x84>

0000000080005de4 <__memmove>:
    80005de4:	ff010113          	addi	sp,sp,-16
    80005de8:	00813423          	sd	s0,8(sp)
    80005dec:	01010413          	addi	s0,sp,16
    80005df0:	0e060863          	beqz	a2,80005ee0 <__memmove+0xfc>
    80005df4:	fff6069b          	addiw	a3,a2,-1
    80005df8:	0006881b          	sext.w	a6,a3
    80005dfc:	0ea5e863          	bltu	a1,a0,80005eec <__memmove+0x108>
    80005e00:	00758713          	addi	a4,a1,7
    80005e04:	00a5e7b3          	or	a5,a1,a0
    80005e08:	40a70733          	sub	a4,a4,a0
    80005e0c:	0077f793          	andi	a5,a5,7
    80005e10:	00f73713          	sltiu	a4,a4,15
    80005e14:	00174713          	xori	a4,a4,1
    80005e18:	0017b793          	seqz	a5,a5
    80005e1c:	00e7f7b3          	and	a5,a5,a4
    80005e20:	10078863          	beqz	a5,80005f30 <__memmove+0x14c>
    80005e24:	00900793          	li	a5,9
    80005e28:	1107f463          	bgeu	a5,a6,80005f30 <__memmove+0x14c>
    80005e2c:	0036581b          	srliw	a6,a2,0x3
    80005e30:	fff8081b          	addiw	a6,a6,-1
    80005e34:	02081813          	slli	a6,a6,0x20
    80005e38:	01d85893          	srli	a7,a6,0x1d
    80005e3c:	00858813          	addi	a6,a1,8
    80005e40:	00058793          	mv	a5,a1
    80005e44:	00050713          	mv	a4,a0
    80005e48:	01088833          	add	a6,a7,a6
    80005e4c:	0007b883          	ld	a7,0(a5)
    80005e50:	00878793          	addi	a5,a5,8
    80005e54:	00870713          	addi	a4,a4,8
    80005e58:	ff173c23          	sd	a7,-8(a4)
    80005e5c:	ff0798e3          	bne	a5,a6,80005e4c <__memmove+0x68>
    80005e60:	ff867713          	andi	a4,a2,-8
    80005e64:	02071793          	slli	a5,a4,0x20
    80005e68:	0207d793          	srli	a5,a5,0x20
    80005e6c:	00f585b3          	add	a1,a1,a5
    80005e70:	40e686bb          	subw	a3,a3,a4
    80005e74:	00f507b3          	add	a5,a0,a5
    80005e78:	06e60463          	beq	a2,a4,80005ee0 <__memmove+0xfc>
    80005e7c:	0005c703          	lbu	a4,0(a1)
    80005e80:	00e78023          	sb	a4,0(a5)
    80005e84:	04068e63          	beqz	a3,80005ee0 <__memmove+0xfc>
    80005e88:	0015c603          	lbu	a2,1(a1)
    80005e8c:	00100713          	li	a4,1
    80005e90:	00c780a3          	sb	a2,1(a5)
    80005e94:	04e68663          	beq	a3,a4,80005ee0 <__memmove+0xfc>
    80005e98:	0025c603          	lbu	a2,2(a1)
    80005e9c:	00200713          	li	a4,2
    80005ea0:	00c78123          	sb	a2,2(a5)
    80005ea4:	02e68e63          	beq	a3,a4,80005ee0 <__memmove+0xfc>
    80005ea8:	0035c603          	lbu	a2,3(a1)
    80005eac:	00300713          	li	a4,3
    80005eb0:	00c781a3          	sb	a2,3(a5)
    80005eb4:	02e68663          	beq	a3,a4,80005ee0 <__memmove+0xfc>
    80005eb8:	0045c603          	lbu	a2,4(a1)
    80005ebc:	00400713          	li	a4,4
    80005ec0:	00c78223          	sb	a2,4(a5)
    80005ec4:	00e68e63          	beq	a3,a4,80005ee0 <__memmove+0xfc>
    80005ec8:	0055c603          	lbu	a2,5(a1)
    80005ecc:	00500713          	li	a4,5
    80005ed0:	00c782a3          	sb	a2,5(a5)
    80005ed4:	00e68663          	beq	a3,a4,80005ee0 <__memmove+0xfc>
    80005ed8:	0065c703          	lbu	a4,6(a1)
    80005edc:	00e78323          	sb	a4,6(a5)
    80005ee0:	00813403          	ld	s0,8(sp)
    80005ee4:	01010113          	addi	sp,sp,16
    80005ee8:	00008067          	ret
    80005eec:	02061713          	slli	a4,a2,0x20
    80005ef0:	02075713          	srli	a4,a4,0x20
    80005ef4:	00e587b3          	add	a5,a1,a4
    80005ef8:	f0f574e3          	bgeu	a0,a5,80005e00 <__memmove+0x1c>
    80005efc:	02069613          	slli	a2,a3,0x20
    80005f00:	02065613          	srli	a2,a2,0x20
    80005f04:	fff64613          	not	a2,a2
    80005f08:	00e50733          	add	a4,a0,a4
    80005f0c:	00c78633          	add	a2,a5,a2
    80005f10:	fff7c683          	lbu	a3,-1(a5)
    80005f14:	fff78793          	addi	a5,a5,-1
    80005f18:	fff70713          	addi	a4,a4,-1
    80005f1c:	00d70023          	sb	a3,0(a4)
    80005f20:	fec798e3          	bne	a5,a2,80005f10 <__memmove+0x12c>
    80005f24:	00813403          	ld	s0,8(sp)
    80005f28:	01010113          	addi	sp,sp,16
    80005f2c:	00008067          	ret
    80005f30:	02069713          	slli	a4,a3,0x20
    80005f34:	02075713          	srli	a4,a4,0x20
    80005f38:	00170713          	addi	a4,a4,1
    80005f3c:	00e50733          	add	a4,a0,a4
    80005f40:	00050793          	mv	a5,a0
    80005f44:	0005c683          	lbu	a3,0(a1)
    80005f48:	00178793          	addi	a5,a5,1
    80005f4c:	00158593          	addi	a1,a1,1
    80005f50:	fed78fa3          	sb	a3,-1(a5)
    80005f54:	fee798e3          	bne	a5,a4,80005f44 <__memmove+0x160>
    80005f58:	f89ff06f          	j	80005ee0 <__memmove+0xfc>
	...
