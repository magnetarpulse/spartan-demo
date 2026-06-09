#include <neorv32.h>

#define BAUD_RATE 19200

int main() {
	neorv32_rte_setup();
	neorv32_uart0_setup(BAUD_RATE, 0);
	
	neorv32_aux_print_logo();
	
	while (1) {
		neorv32_uart0_puts("Hello world!\n");
	}
	
	return 0;
}
