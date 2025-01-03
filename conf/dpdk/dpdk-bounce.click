/**
 * This simple configuration bounces packets from a single interface to itself.
 * MAC addresses are inverted
 *
 * A minimal launch line would be :
 * sudo bin/click --dpdk -- conf/dpdk/dpdk-bounce.click
 */

define ($print true)

FromDPDKDevice(0)
	-> EtherMirror()
	-> Print(ACTIVE $print)
	-> ToDPDKDevice(0)

InfiniteSource(DATA \<00 00 c0 ae 67 ef  00 00 00 00 00 00  08 00
	45 00 00 28  00 00 00 00  40 11 77 c3  01 00 00 01
	02 00 00 02  13 69 13 69  00 14 d6 41  55 44 50 20
	70 61 63 6b  65 74 21 0a>, LIMIT -1, ACTIVE true, STOP false)
	-> ToDPDKDevice(1)


