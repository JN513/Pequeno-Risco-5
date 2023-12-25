
all: ./build/out.bit

./build/out.bit: ./build/out.config
	ecppack ./build/out.config ./build/out.bit

./build/out.config: ./build/out.json
	nextpnr-ecp5 --json ./build/out.json --write ./build/out_pnr.json --45k \
		--lpf pinout.lpf --textcfg ./build/out.config --package CABGA381

./build/out.json: hello-world-colorlight-i9.v pinout.lpf buildFolder
	yosys -p " \
		read_verilog hello-world-colorlight-i9.v; \
		read_verilog src/registers.v; \
		read_verilog src/alu.v; \
		read_verilog src/pc.v; \
		read_verilog src/top.v; \
		synth_ecp5 -json ./build/out.json \
	"

buildFolder:
	mkdir -p build

clean:
	rm -rf build

flash:
	openFPGALoader -b colorlight-i9 ./build/out.bit

run_all: ./build/out.bit flash