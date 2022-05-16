// -----------------------------------------------------------------------------
// 'foo' Register Component
// Revision: 34
// -----------------------------------------------------------------------------
// Generated on 2022-05-12 at 05:10 (UTC) by airhdl version 2022.04.1-119
// -----------------------------------------------------------------------------
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
// -----------------------------------------------------------------------------

`default_nettype none

`include "axi_regs_pkg.sv"

module axi_regs #(
    parameter AXI_ADDR_WIDTH = 32, // width of the AXI address bus
    parameter logic [31:0] BASEADDR = 32'h00000000 // the register file's system base address
    ) (
    // Clock and Reset
    input  wire                      axi_aclk,
    input  wire                      axi_aresetn,

    // AXI Write Address Channel
    input  wire [AXI_ADDR_WIDTH-1:0] s_axi_awaddr,
    input  wire [2:0]                s_axi_awprot,
    input  wire                      s_axi_awvalid,
    input  wire [7:0]                s_axi_awid,
    input  wire [7:0]                s_axi_awlen,
    input  wire [2:0]                s_axi_awsize,
    output wire                      s_axi_awready,

    // AXI Write Data Channel
    input  wire [31:0]               s_axi_wdata,
    input  wire [3:0]                s_axi_wstrb,
    input  wire                      s_axi_wvalid,
    input  wire                      s_axi_wlast,
    output wire                      s_axi_wready,

    // AXI Read Address Channel
    input  wire [AXI_ADDR_WIDTH-1:0] s_axi_araddr,
    input  wire [2:0]                s_axi_arprot,
    input  wire                      s_axi_arvalid,
    input  wire [7:0]                s_axi_arid,
    input  wire [7:0]                s_axi_arlen,
    input  wire [2:0]                s_axi_arsize,
    output wire                      s_axi_arready,

    // AXI Read Data Channel
    output wire [31:0]               s_axi_rdata,
    output wire [1:0]                s_axi_rresp,
    output wire                      s_axi_rvalid,
    output wire [7:0]                s_axi_rid,
    output wire                      s_axi_rlast,
    input  wire                      s_axi_rready,

    // AXI Write Response Channel
    output wire [1:0]                s_axi_bresp,
    output wire                      s_axi_bvalid,
    output wire [7:0]                s_axi_bid,
    input  wire                      s_axi_bready,

    // User Ports
    output wire reg0_strobe, // Strobe logic for register 'reg0' (pulsed when the register is written from the bus)
    output wire [31:0] reg0_value, // Value of register 'reg0', field 'value'
    output wire reg1_strobe, // Strobe logic for register 'reg1' (pulsed when the register is written from the bus)
    output wire [31:0] reg1_value, // Value of register 'reg1', field 'value'
    output wire reg2_strobe, // Strobe logic for register 'reg2' (pulsed when the register is written from the bus)
    output wire [31:0] reg2_value, // Value of register 'reg2', field 'value'
    output wire reg3_strobe, // Strobe logic for register 'reg3' (pulsed when the register is written from the bus)
    output wire [31:0] reg3_value, // Value of register 'reg3', field 'value'
    output wire reg4_strobe, // Strobe logic for register 'reg4' (pulsed when the register is read from the bus)
    input wire [31:0] reg4_value, // Value of register 'reg4', field 'value'
    output wire reg5_strobe, // Strobe logic for register 'reg5' (pulsed when the register is written from the bus)
    output wire [31:0] reg5_value, // Value of register 'reg5', field 'value'
    input wire reg6_value_set, // Set logic for register 'reg6', field 'value' (pulse to set the field to 1'b1)
    output wire reg7_strobe, // Strobe logic for register 'reg7' (pulsed when the register is written from the bus)
    output wire [31:0] reg7_value, // Value of register 'reg7', field 'value'
    output wire reg8_strobe, // Strobe logic for register 'reg8' (pulsed when the register is written from the bus)
    output wire [31:0] reg8_value, // Value of register 'reg8', field 'value'
    output wire reg9_strobe, // Strobe logic for register 'reg9' (pulsed when the register is written from the bus)
    output wire [31:0] reg9_value, // Value of register 'reg9', field 'value'
    output wire reg10_strobe, // Strobe logic for register 'reg10' (pulsed when the register is written from the bus)
    output wire [31:0] reg10_value, // Value of register 'reg10', field 'value'
    output wire reg11_strobe, // Strobe logic for register 'reg11' (pulsed when the register is written from the bus)
    output wire [31:0] reg11_value, // Value of register 'reg11', field 'value'
    output wire reg12_strobe, // Strobe logic for register 'reg12' (pulsed when the register is written from the bus)
    output wire [31:0] reg12_value, // Value of register 'reg12', field 'value'
    output wire reg13_strobe, // Strobe logic for register 'reg13' (pulsed when the register is written from the bus)
    output wire [31:0] reg13_value, // Value of register 'reg13', field 'value'
    output wire reg14_strobe, // Strobe logic for register 'reg14' (pulsed when the register is written from the bus)
    output wire [31:0] reg14_value, // Value of register 'reg14', field 'value'
    output wire reg15_strobe, // Strobe logic for register 'reg15' (pulsed when the register is written from the bus)
    output wire [31:0] reg15_value, // Value of register 'reg15', field 'value'
    output wire reg16_strobe, // Strobe logic for register 'reg16' (pulsed when the register is written from the bus)
    output wire [31:0] reg16_value, // Value of register 'reg16', field 'value'
    output wire reg17_strobe, // Strobe logic for register 'reg17' (pulsed when the register is written from the bus)
    output wire [31:0] reg17_value, // Value of register 'reg17', field 'value'
    output wire reg18_strobe, // Strobe logic for register 'reg18' (pulsed when the register is written from the bus)
    output wire [31:0] reg18_value, // Value of register 'reg18', field 'value'
    output wire reg19_strobe, // Strobe logic for register 'reg19' (pulsed when the register is written from the bus)
    output wire [31:0] reg19_value, // Value of register 'reg19', field 'value'
    output wire reg20_strobe, // Strobe logic for register 'reg20' (pulsed when the register is written from the bus)
    output wire [31:0] reg20_value, // Value of register 'reg20', field 'value'
    output wire reg21_strobe, // Strobe logic for register 'reg21' (pulsed when the register is written from the bus)
    output wire [31:0] reg21_value, // Value of register 'reg21', field 'value'
    output wire reg22_strobe, // Strobe logic for register 'reg22' (pulsed when the register is written from the bus)
    output wire [31:0] reg22_value, // Value of register 'reg22', field 'value'
    output wire reg23_strobe, // Strobe logic for register 'reg23' (pulsed when the register is written from the bus)
    output wire [31:0] reg23_value, // Value of register 'reg23', field 'value'
    output wire reg24_strobe, // Strobe logic for register 'reg24' (pulsed when the register is written from the bus)
    output wire [31:0] reg24_value, // Value of register 'reg24', field 'value'
    output wire reg25_strobe, // Strobe logic for register 'reg25' (pulsed when the register is written from the bus)
    output wire [31:0] reg25_value, // Value of register 'reg25', field 'value'
    output wire reg26_strobe, // Strobe logic for register 'reg26' (pulsed when the register is written from the bus)
    output wire [31:0] reg26_value, // Value of register 'reg26', field 'value'
    output wire reg27_strobe, // Strobe logic for register 'reg27' (pulsed when the register is written from the bus)
    output wire [31:0] reg27_value, // Value of register 'reg27', field 'value'
    output wire reg28_strobe, // Strobe logic for register 'reg28' (pulsed when the register is written from the bus)
    output wire [31:0] reg28_value, // Value of register 'reg28', field 'value'
    output wire reg29_strobe, // Strobe logic for register 'reg29' (pulsed when the register is written from the bus)
    output wire [31:0] reg29_value, // Value of register 'reg29', field 'value'
    output wire reg30_strobe, // Strobe logic for register 'reg30' (pulsed when the register is written from the bus)
    output wire [31:0] reg30_value, // Value of register 'reg30', field 'value'
    output wire reg31_strobe, // Strobe logic for register 'reg31' (pulsed when the register is written from the bus)
    output wire [31:0] reg31_value // Value of register 'reg31', field 'value'
    );

    // Constants
    localparam logic [1:0]                      AXI_OKAY        = 2'b00;
    localparam logic [1:0]                      AXI_DECERR      = 2'b11;

    // Registered signals
    logic                                       s_axi_awready_r;
    logic                                       s_axi_wready_r;
    logic [$bits(s_axi_awaddr)-1:0]             s_axi_awaddr_reg_r;
    logic                                       s_axi_bvalid_r;
    logic [$bits(s_axi_bid)-1:0]                s_axi_bid_r;
    logic [$bits(s_axi_bresp)-1:0]              s_axi_bresp_r;
    logic                                       s_axi_arready_r;
    logic [$bits(s_axi_araddr)-1:0]             s_axi_araddr_reg_r;
    logic                                       s_axi_rvalid_r;
    logic                                       s_axi_rlast_r;
    logic [$bits(s_axi_rid)-1:0]                s_axi_rid_r;
    logic [$bits(s_axi_rresp)-1:0]              s_axi_rresp_r;
    logic [$bits(s_axi_wdata)-1:0]              s_axi_wdata_reg_r;
    logic [$bits(s_axi_wstrb)-1:0]              s_axi_wstrb_reg_r;
    logic [$bits(s_axi_rdata)-1:0]              s_axi_rdata_r;

    // User-defined registers
    logic s_reg0_strobe_r;
    logic [31:0] s_reg_reg0_value_r;
    logic s_reg1_strobe_r;
    logic [31:0] s_reg_reg1_value_r;
    logic s_reg2_strobe_r;
    logic [31:0] s_reg_reg2_value_r;
    logic s_reg3_strobe_r;
    logic [31:0] s_reg_reg3_value_r;
    logic s_reg4_strobe_r;
    logic [31:0] s_reg_reg4_value;
    logic s_reg5_strobe_r;
    logic [31:0] s_reg_reg5_value_r;
    logic [0:0] s_reg_reg6_value_r;
    logic s_reg7_strobe_r;
    logic [31:0] s_reg_reg7_value_r;
    logic s_reg8_strobe_r;
    logic [31:0] s_reg_reg8_value_r;
    logic s_reg9_strobe_r;
    logic [31:0] s_reg_reg9_value_r;
    logic s_reg10_strobe_r;
    logic [31:0] s_reg_reg10_value_r;
    logic s_reg11_strobe_r;
    logic [31:0] s_reg_reg11_value_r;
    logic s_reg12_strobe_r;
    logic [31:0] s_reg_reg12_value_r;
    logic s_reg13_strobe_r;
    logic [31:0] s_reg_reg13_value_r;
    logic s_reg14_strobe_r;
    logic [31:0] s_reg_reg14_value_r;
    logic s_reg15_strobe_r;
    logic [31:0] s_reg_reg15_value_r;
    logic s_reg16_strobe_r;
    logic [31:0] s_reg_reg16_value_r;
    logic s_reg17_strobe_r;
    logic [31:0] s_reg_reg17_value_r;
    logic s_reg18_strobe_r;
    logic [31:0] s_reg_reg18_value_r;
    logic s_reg19_strobe_r;
    logic [31:0] s_reg_reg19_value_r;
    logic s_reg20_strobe_r;
    logic [31:0] s_reg_reg20_value_r;
    logic s_reg21_strobe_r;
    logic [31:0] s_reg_reg21_value_r;
    logic s_reg22_strobe_r;
    logic [31:0] s_reg_reg22_value_r;
    logic s_reg23_strobe_r;
    logic [31:0] s_reg_reg23_value_r;
    logic s_reg24_strobe_r;
    logic [31:0] s_reg_reg24_value_r;
    logic s_reg25_strobe_r;
    logic [31:0] s_reg_reg25_value_r;
    logic s_reg26_strobe_r;
    logic [31:0] s_reg_reg26_value_r;
    logic s_reg27_strobe_r;
    logic [31:0] s_reg_reg27_value_r;
    logic s_reg28_strobe_r;
    logic [31:0] s_reg_reg28_value_r;
    logic s_reg29_strobe_r;
    logic [31:0] s_reg_reg29_value_r;
    logic s_reg30_strobe_r;
    logic [31:0] s_reg_reg30_value_r;
    logic s_reg31_strobe_r;
    logic [31:0] s_reg_reg31_value_r;

    //--------------------------------------------------------------------------
    // Inputs
    //
    assign s_reg_reg4_value = reg4_value;

    //--------------------------------------------------------------------------
    // Read-transaction FSM
    //
    localparam MAX_MEMORY_LATENCY = 5;

    typedef enum {
        READ_IDLE,
        READ_REGISTER,
        WAIT_MEMORY_RDATA,
        READ_RESPONSE,
        READ_DONE
    } read_state_t;

    always_ff@(posedge axi_aclk or negedge axi_aresetn) begin: read_fsm
        // registered state variables
        read_state_t v_state_r;
        logic [31:0] v_rdata_r;
        logic [1:0] v_rresp_r;
        logic [$clog2(MAX_MEMORY_LATENCY)-1:0] v_mem_wait_count_r;
        // combinatorial helper variables
        logic v_addr_hit;
        logic [AXI_ADDR_WIDTH-1:0] v_mem_addr;
        if (~axi_aresetn) begin
            v_state_r          <= READ_IDLE;
            v_rdata_r          <= '0;
            v_rresp_r          <= '0;
            v_mem_wait_count_r <= '0;
            s_axi_arready_r    <= '0;
            s_axi_rvalid_r     <= '0;
            s_axi_rlast_r      <= '0;
            s_axi_rid_r        <= '0;
            s_axi_rresp_r      <= '0;
            s_axi_araddr_reg_r <= '0;
            s_axi_rdata_r      <= '0;
            s_reg4_strobe_r    <= '0;
        end else begin
            // Default values:
            s_axi_arready_r <= 1'b0;
            s_reg4_strobe_r <= '0;

            case (v_state_r)

                // Wait for the start of a read transaction, which is
                // initiated by the assertion of ARVALID
                READ_IDLE: begin
                    if (s_axi_arvalid) begin
                        s_axi_araddr_reg_r <= s_axi_araddr;     // save the read address
                        s_axi_arready_r    <= 1'b1;             // acknowledge the read-address
                        v_state_r          <= READ_REGISTER;
                    end
                end

                // Read from the actual storage element
                READ_REGISTER: begin
                    // defaults:
                    v_addr_hit = 1'b0;
                    v_rdata_r  <= '0;

                    // register 'reg0' at address offset 0x0
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG0_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg0_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg1' at address offset 0x4
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG1_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg1_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg2' at address offset 0x8
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG2_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg2_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg3' at address offset 0xC
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG3_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg3_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg4' at address offset 0x10
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG4_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg4_value;
                        s_reg4_strobe_r <= 1'b1;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg6' at address offset 0x18
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG6_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[0:0] <= s_reg_reg6_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg7' at address offset 0x1C
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG7_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg7_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg8' at address offset 0x20
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG8_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg8_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg9' at address offset 0x24
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG9_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg9_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg10' at address offset 0x28
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG10_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg10_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg11' at address offset 0x2C
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG11_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg11_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg12' at address offset 0x30
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG12_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg12_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg13' at address offset 0x34
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG13_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg13_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg14' at address offset 0x38
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG14_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg14_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg15' at address offset 0x3C
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG15_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg15_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg16' at address offset 0x40
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG16_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg16_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg17' at address offset 0x44
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG17_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg17_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg18' at address offset 0x48
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG18_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg18_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg19' at address offset 0x4C
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG19_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg19_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg20' at address offset 0x50
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG20_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg20_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg21' at address offset 0x54
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG21_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg21_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg22' at address offset 0x58
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG22_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg22_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg23' at address offset 0x5C
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG23_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg23_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg24' at address offset 0x60
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG24_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg24_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg25' at address offset 0x64
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG25_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg25_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg26' at address offset 0x68
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG26_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg26_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg27' at address offset 0x6C
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG27_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg27_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg28' at address offset 0x70
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG28_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg28_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg29' at address offset 0x74
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG29_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg29_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg30' at address offset 0x78
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG30_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg30_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    // register 'reg31' at address offset 0x7C
                    if (s_axi_araddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG31_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        v_rdata_r[31:0] <= s_reg_reg31_value_r;
                        v_state_r <= READ_RESPONSE;
                    end
                    if (v_addr_hit) begin
                        v_rresp_r <= AXI_OKAY;
                    end else begin
                        v_rresp_r <= AXI_DECERR;
                        // pragma translate_off
                        $warning("ARADDR decode error");
                        // pragma translate_on
                        v_state_r <= READ_RESPONSE;
                    end
                end

                // Wait for memory read data
                WAIT_MEMORY_RDATA: begin
                    if (v_mem_wait_count_r == 0) begin
                        v_state_r <= READ_RESPONSE;
                    end else begin
                        v_mem_wait_count_r <= v_mem_wait_count_r - 1;
                    end
                end

                // Generate read response
                READ_RESPONSE: begin
                    s_axi_rvalid_r <= 1'b1;
                    s_axi_rlast_r  <= 1'b1;
                    s_axi_rresp_r  <= v_rresp_r;
                    s_axi_rdata_r  <= v_rdata_r;
                    v_state_r      <= READ_DONE;
                end

                // Write transaction completed, wait for master RREADY to proceed
                READ_DONE: begin
                    if (s_axi_rready) begin
                        s_axi_rvalid_r <= 1'b0;
                        s_axi_rlast_r  <= 1'b0;
                        s_axi_rdata_r  <= '0;
                        v_state_r      <= READ_IDLE;
                    end
                end

            endcase
        end
    end: read_fsm

    //--------------------------------------------------------------------------
    // Write-transaction FSM
    //

    typedef enum {
        WRITE_IDLE,
        WRITE_ADDR_FIRST,
        WRITE_DATA_FIRST,
        WRITE_UPDATE_REGISTER,
        WRITE_DONE
    } write_state_t;

    always_ff@(posedge axi_aclk or negedge axi_aresetn) begin: write_fsm
        // registered state variables
        write_state_t v_state_r;
        // combinatorial helper variables
        logic v_addr_hit;
        logic [AXI_ADDR_WIDTH-1:0] v_mem_addr;
        if (~axi_aresetn) begin
            v_state_r                   <= WRITE_IDLE;
            s_axi_awready_r             <= 1'b0;
            s_axi_wready_r              <= 1'b0;
            s_axi_awaddr_reg_r          <= '0;
            s_axi_wdata_reg_r           <= '0;
            s_axi_wstrb_reg_r           <= '0;
            s_axi_bvalid_r              <= 1'b0;
            s_axi_bid_r                 <= '0;
            s_axi_bresp_r               <= '0;

            s_reg0_strobe_r <= '0;
            s_reg_reg0_value_r <= axi_regs_pkg::REG0_VALUE_RESET;
            s_reg1_strobe_r <= '0;
            s_reg_reg1_value_r <= axi_regs_pkg::REG1_VALUE_RESET;
            s_reg2_strobe_r <= '0;
            s_reg_reg2_value_r <= axi_regs_pkg::REG2_VALUE_RESET;
            s_reg3_strobe_r <= '0;
            s_reg_reg3_value_r <= axi_regs_pkg::REG3_VALUE_RESET;
            s_reg5_strobe_r <= '0;
            s_reg_reg5_value_r <= axi_regs_pkg::REG5_VALUE_RESET;
            s_reg_reg6_value_r <= axi_regs_pkg::REG6_VALUE_RESET;
            s_reg7_strobe_r <= '0;
            s_reg_reg7_value_r <= axi_regs_pkg::REG7_VALUE_RESET;
            s_reg8_strobe_r <= '0;
            s_reg_reg8_value_r <= axi_regs_pkg::REG8_VALUE_RESET;
            s_reg9_strobe_r <= '0;
            s_reg_reg9_value_r <= axi_regs_pkg::REG9_VALUE_RESET;
            s_reg10_strobe_r <= '0;
            s_reg_reg10_value_r <= axi_regs_pkg::REG10_VALUE_RESET;
            s_reg11_strobe_r <= '0;
            s_reg_reg11_value_r <= axi_regs_pkg::REG11_VALUE_RESET;
            s_reg12_strobe_r <= '0;
            s_reg_reg12_value_r <= axi_regs_pkg::REG12_VALUE_RESET;
            s_reg13_strobe_r <= '0;
            s_reg_reg13_value_r <= axi_regs_pkg::REG13_VALUE_RESET;
            s_reg14_strobe_r <= '0;
            s_reg_reg14_value_r <= axi_regs_pkg::REG14_VALUE_RESET;
            s_reg15_strobe_r <= '0;
            s_reg_reg15_value_r <= axi_regs_pkg::REG15_VALUE_RESET;
            s_reg16_strobe_r <= '0;
            s_reg_reg16_value_r <= axi_regs_pkg::REG16_VALUE_RESET;
            s_reg17_strobe_r <= '0;
            s_reg_reg17_value_r <= axi_regs_pkg::REG17_VALUE_RESET;
            s_reg18_strobe_r <= '0;
            s_reg_reg18_value_r <= axi_regs_pkg::REG18_VALUE_RESET;
            s_reg19_strobe_r <= '0;
            s_reg_reg19_value_r <= axi_regs_pkg::REG19_VALUE_RESET;
            s_reg20_strobe_r <= '0;
            s_reg_reg20_value_r <= axi_regs_pkg::REG20_VALUE_RESET;
            s_reg21_strobe_r <= '0;
            s_reg_reg21_value_r <= axi_regs_pkg::REG21_VALUE_RESET;
            s_reg22_strobe_r <= '0;
            s_reg_reg22_value_r <= axi_regs_pkg::REG22_VALUE_RESET;
            s_reg23_strobe_r <= '0;
            s_reg_reg23_value_r <= axi_regs_pkg::REG23_VALUE_RESET;
            s_reg24_strobe_r <= '0;
            s_reg_reg24_value_r <= axi_regs_pkg::REG24_VALUE_RESET;
            s_reg25_strobe_r <= '0;
            s_reg_reg25_value_r <= axi_regs_pkg::REG25_VALUE_RESET;
            s_reg26_strobe_r <= '0;
            s_reg_reg26_value_r <= axi_regs_pkg::REG26_VALUE_RESET;
            s_reg27_strobe_r <= '0;
            s_reg_reg27_value_r <= axi_regs_pkg::REG27_VALUE_RESET;
            s_reg28_strobe_r <= '0;
            s_reg_reg28_value_r <= axi_regs_pkg::REG28_VALUE_RESET;
            s_reg29_strobe_r <= '0;
            s_reg_reg29_value_r <= axi_regs_pkg::REG29_VALUE_RESET;
            s_reg30_strobe_r <= '0;
            s_reg_reg30_value_r <= axi_regs_pkg::REG30_VALUE_RESET;
            s_reg31_strobe_r <= '0;
            s_reg_reg31_value_r <= axi_regs_pkg::REG31_VALUE_RESET;

        end else begin
            // Default values:
            s_axi_awready_r <= 1'b0;
            s_axi_wready_r  <= 1'b0;
            s_reg0_strobe_r <= '0;
            s_reg1_strobe_r <= '0;
            s_reg2_strobe_r <= '0;
            s_reg3_strobe_r <= '0;
            s_reg5_strobe_r <= '0;
            s_reg7_strobe_r <= '0;
            s_reg8_strobe_r <= '0;
            s_reg9_strobe_r <= '0;
            s_reg10_strobe_r <= '0;
            s_reg11_strobe_r <= '0;
            s_reg12_strobe_r <= '0;
            s_reg13_strobe_r <= '0;
            s_reg14_strobe_r <= '0;
            s_reg15_strobe_r <= '0;
            s_reg16_strobe_r <= '0;
            s_reg17_strobe_r <= '0;
            s_reg18_strobe_r <= '0;
            s_reg19_strobe_r <= '0;
            s_reg20_strobe_r <= '0;
            s_reg21_strobe_r <= '0;
            s_reg22_strobe_r <= '0;
            s_reg23_strobe_r <= '0;
            s_reg24_strobe_r <= '0;
            s_reg25_strobe_r <= '0;
            s_reg26_strobe_r <= '0;
            s_reg27_strobe_r <= '0;
            s_reg28_strobe_r <= '0;
            s_reg29_strobe_r <= '0;
            s_reg30_strobe_r <= '0;
            s_reg31_strobe_r <= '0;
            v_addr_hit = 1'b0;

            case (v_state_r)

                // Wait for the start of a write transaction, which may be
                // initiated by either of the following conditions:
                //   * assertion of both AWVALID and WVALID
                //   * assertion of AWVALID
                //   * assertion of WVALID
                WRITE_IDLE: begin
                    if (s_axi_awvalid && s_axi_wvalid) begin
                        s_axi_awaddr_reg_r <= s_axi_awaddr; // save the write-address
                        s_axi_awready_r    <= 1'b1; // acknowledge the write-address
                        s_axi_wdata_reg_r  <= s_axi_wdata; // save the write-data
                        s_axi_wstrb_reg_r  <= s_axi_wstrb; // save the write-strobe
                        s_axi_wready_r     <= 1'b1; // acknowledge the write-data
                        v_state_r          <= WRITE_UPDATE_REGISTER;
                    end else if (s_axi_awvalid) begin
                        s_axi_awaddr_reg_r <= s_axi_awaddr; // save the write-address
                        s_axi_awready_r    <= 1'b1; // acknowledge the write-address
                        v_state_r          <= WRITE_ADDR_FIRST;
                    end else if (s_axi_wvalid) begin
                        s_axi_wdata_reg_r <= s_axi_wdata; // save the write-data
                        s_axi_wstrb_reg_r <= s_axi_wstrb; // save the write-strobe
                        s_axi_wready_r    <= 1'b1; // acknowledge the write-data
                        v_state_r         <= WRITE_DATA_FIRST;
                    end
                end

                // Address-first write transaction: wait for the write-data
                WRITE_ADDR_FIRST: begin
                    if (s_axi_wvalid) begin
                        s_axi_wdata_reg_r <= s_axi_wdata; // save the write-data
                        s_axi_wstrb_reg_r <= s_axi_wstrb; // save the write-strobe
                        s_axi_wready_r    <= 1'b1; // acknowledge the write-data
                        v_state_r         <= WRITE_UPDATE_REGISTER;
                    end
                end

                // Data-first write transaction: wait for the write-address
                WRITE_DATA_FIRST: begin
                    if (s_axi_awvalid) begin
                        s_axi_awaddr_reg_r <= s_axi_awaddr; // save the write-address
                        s_axi_awready_r    <= 1'b1; // acknowledge the write-address
                        v_state_r          <= WRITE_UPDATE_REGISTER;
                    end
                end

                // Update the actual storage element
                WRITE_UPDATE_REGISTER: begin
                    s_axi_bresp_r  <= AXI_OKAY; // default value, may be overriden in case of decode error
                    s_axi_bvalid_r <= 1'b1;

                    // register 'reg0' at address offset 0x0
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG0_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg0_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg0_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg0_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg0_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg0_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg0_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg0_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg0_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg0_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg0_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg0_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg0_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg0_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg0_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg0_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg0_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg0_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg0_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg0_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg0_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg0_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg0_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg0_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg0_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg0_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg0_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg0_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg0_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg0_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg0_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg0_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg0_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg0_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg1' at address offset 0x4
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG1_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg1_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg1_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg1_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg1_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg1_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg1_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg1_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg1_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg1_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg1_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg1_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg1_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg1_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg1_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg1_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg1_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg1_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg1_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg1_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg1_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg1_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg1_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg1_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg1_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg1_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg1_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg1_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg1_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg1_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg1_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg1_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg1_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg1_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg2' at address offset 0x8
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG2_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg2_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg2_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg2_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg2_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg2_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg2_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg2_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg2_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg2_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg2_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg2_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg2_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg2_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg2_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg2_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg2_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg2_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg2_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg2_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg2_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg2_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg2_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg2_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg2_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg2_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg2_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg2_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg2_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg2_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg2_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg2_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg2_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg2_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg3' at address offset 0xC
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG3_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg3_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg3_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg3_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg3_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg3_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg3_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg3_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg3_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg3_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg3_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg3_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg3_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg3_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg3_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg3_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg3_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg3_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg3_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg3_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg3_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg3_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg3_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg3_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg3_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg3_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg3_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg3_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg3_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg3_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg3_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg3_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg3_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg3_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end


                    // register 'reg5' at address offset 0x14
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG5_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg5_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg5_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg5_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg5_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg5_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg5_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg5_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg5_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg5_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg5_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg5_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg5_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg5_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg5_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg5_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg5_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg5_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg5_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg5_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg5_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg5_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg5_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg5_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg5_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg5_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg5_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg5_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg5_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg5_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg5_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg5_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg5_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg5_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg6' at address offset 0x18
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG6_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            if (s_axi_wdata_reg_r[0]) begin // ONE_TO_CLEAR
                                s_reg_reg6_value_r[0] <=  1'b0; // value[0]
                            end
                        end
                    end

                    // register 'reg7' at address offset 0x1C
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG7_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg7_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg7_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg7_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg7_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg7_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg7_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg7_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg7_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg7_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg7_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg7_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg7_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg7_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg7_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg7_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg7_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg7_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg7_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg7_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg7_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg7_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg7_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg7_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg7_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg7_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg7_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg7_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg7_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg7_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg7_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg7_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg7_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg7_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg8' at address offset 0x20
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG8_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg8_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg8_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg8_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg8_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg8_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg8_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg8_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg8_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg8_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg8_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg8_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg8_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg8_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg8_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg8_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg8_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg8_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg8_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg8_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg8_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg8_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg8_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg8_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg8_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg8_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg8_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg8_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg8_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg8_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg8_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg8_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg8_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg8_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg9' at address offset 0x24
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG9_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg9_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg9_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg9_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg9_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg9_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg9_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg9_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg9_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg9_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg9_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg9_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg9_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg9_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg9_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg9_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg9_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg9_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg9_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg9_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg9_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg9_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg9_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg9_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg9_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg9_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg9_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg9_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg9_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg9_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg9_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg9_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg9_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg9_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg10' at address offset 0x28
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG10_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg10_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg10_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg10_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg10_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg10_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg10_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg10_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg10_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg10_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg10_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg10_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg10_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg10_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg10_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg10_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg10_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg10_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg10_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg10_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg10_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg10_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg10_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg10_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg10_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg10_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg10_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg10_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg10_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg10_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg10_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg10_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg10_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg10_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg11' at address offset 0x2C
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG11_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg11_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg11_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg11_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg11_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg11_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg11_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg11_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg11_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg11_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg11_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg11_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg11_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg11_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg11_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg11_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg11_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg11_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg11_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg11_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg11_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg11_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg11_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg11_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg11_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg11_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg11_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg11_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg11_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg11_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg11_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg11_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg11_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg11_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg12' at address offset 0x30
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG12_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg12_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg12_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg12_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg12_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg12_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg12_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg12_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg12_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg12_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg12_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg12_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg12_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg12_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg12_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg12_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg12_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg12_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg12_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg12_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg12_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg12_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg12_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg12_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg12_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg12_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg12_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg12_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg12_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg12_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg12_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg12_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg12_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg12_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg13' at address offset 0x34
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG13_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg13_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg13_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg13_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg13_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg13_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg13_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg13_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg13_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg13_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg13_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg13_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg13_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg13_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg13_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg13_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg13_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg13_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg13_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg13_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg13_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg13_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg13_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg13_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg13_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg13_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg13_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg13_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg13_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg13_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg13_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg13_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg13_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg13_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg14' at address offset 0x38
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG14_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg14_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg14_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg14_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg14_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg14_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg14_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg14_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg14_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg14_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg14_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg14_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg14_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg14_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg14_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg14_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg14_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg14_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg14_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg14_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg14_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg14_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg14_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg14_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg14_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg14_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg14_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg14_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg14_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg14_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg14_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg14_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg14_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg14_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg15' at address offset 0x3C
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG15_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg15_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg15_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg15_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg15_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg15_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg15_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg15_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg15_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg15_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg15_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg15_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg15_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg15_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg15_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg15_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg15_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg15_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg15_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg15_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg15_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg15_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg15_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg15_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg15_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg15_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg15_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg15_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg15_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg15_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg15_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg15_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg15_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg15_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg16' at address offset 0x40
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG16_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg16_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg16_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg16_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg16_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg16_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg16_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg16_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg16_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg16_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg16_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg16_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg16_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg16_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg16_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg16_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg16_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg16_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg16_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg16_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg16_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg16_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg16_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg16_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg16_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg16_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg16_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg16_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg16_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg16_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg16_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg16_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg16_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg16_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg17' at address offset 0x44
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG17_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg17_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg17_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg17_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg17_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg17_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg17_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg17_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg17_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg17_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg17_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg17_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg17_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg17_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg17_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg17_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg17_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg17_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg17_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg17_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg17_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg17_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg17_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg17_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg17_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg17_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg17_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg17_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg17_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg17_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg17_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg17_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg17_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg17_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg18' at address offset 0x48
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG18_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg18_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg18_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg18_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg18_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg18_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg18_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg18_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg18_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg18_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg18_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg18_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg18_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg18_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg18_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg18_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg18_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg18_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg18_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg18_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg18_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg18_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg18_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg18_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg18_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg18_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg18_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg18_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg18_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg18_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg18_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg18_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg18_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg18_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg19' at address offset 0x4C
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG19_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg19_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg19_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg19_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg19_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg19_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg19_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg19_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg19_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg19_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg19_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg19_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg19_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg19_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg19_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg19_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg19_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg19_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg19_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg19_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg19_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg19_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg19_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg19_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg19_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg19_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg19_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg19_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg19_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg19_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg19_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg19_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg19_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg19_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg20' at address offset 0x50
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG20_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg20_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg20_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg20_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg20_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg20_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg20_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg20_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg20_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg20_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg20_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg20_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg20_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg20_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg20_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg20_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg20_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg20_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg20_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg20_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg20_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg20_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg20_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg20_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg20_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg20_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg20_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg20_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg20_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg20_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg20_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg20_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg20_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg20_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg21' at address offset 0x54
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG21_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg21_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg21_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg21_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg21_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg21_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg21_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg21_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg21_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg21_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg21_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg21_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg21_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg21_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg21_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg21_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg21_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg21_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg21_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg21_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg21_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg21_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg21_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg21_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg21_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg21_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg21_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg21_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg21_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg21_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg21_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg21_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg21_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg21_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg22' at address offset 0x58
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG22_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg22_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg22_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg22_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg22_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg22_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg22_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg22_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg22_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg22_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg22_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg22_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg22_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg22_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg22_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg22_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg22_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg22_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg22_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg22_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg22_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg22_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg22_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg22_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg22_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg22_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg22_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg22_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg22_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg22_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg22_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg22_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg22_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg22_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg23' at address offset 0x5C
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG23_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg23_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg23_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg23_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg23_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg23_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg23_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg23_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg23_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg23_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg23_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg23_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg23_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg23_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg23_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg23_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg23_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg23_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg23_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg23_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg23_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg23_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg23_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg23_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg23_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg23_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg23_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg23_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg23_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg23_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg23_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg23_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg23_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg23_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg24' at address offset 0x60
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG24_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg24_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg24_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg24_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg24_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg24_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg24_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg24_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg24_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg24_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg24_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg24_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg24_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg24_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg24_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg24_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg24_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg24_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg24_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg24_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg24_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg24_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg24_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg24_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg24_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg24_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg24_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg24_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg24_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg24_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg24_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg24_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg24_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg24_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg25' at address offset 0x64
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG25_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg25_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg25_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg25_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg25_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg25_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg25_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg25_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg25_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg25_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg25_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg25_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg25_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg25_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg25_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg25_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg25_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg25_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg25_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg25_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg25_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg25_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg25_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg25_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg25_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg25_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg25_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg25_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg25_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg25_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg25_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg25_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg25_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg25_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg26' at address offset 0x68
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG26_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg26_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg26_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg26_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg26_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg26_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg26_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg26_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg26_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg26_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg26_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg26_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg26_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg26_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg26_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg26_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg26_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg26_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg26_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg26_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg26_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg26_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg26_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg26_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg26_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg26_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg26_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg26_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg26_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg26_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg26_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg26_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg26_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg26_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg27' at address offset 0x6C
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG27_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg27_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg27_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg27_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg27_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg27_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg27_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg27_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg27_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg27_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg27_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg27_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg27_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg27_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg27_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg27_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg27_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg27_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg27_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg27_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg27_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg27_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg27_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg27_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg27_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg27_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg27_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg27_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg27_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg27_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg27_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg27_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg27_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg27_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg28' at address offset 0x70
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG28_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg28_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg28_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg28_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg28_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg28_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg28_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg28_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg28_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg28_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg28_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg28_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg28_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg28_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg28_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg28_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg28_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg28_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg28_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg28_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg28_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg28_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg28_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg28_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg28_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg28_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg28_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg28_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg28_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg28_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg28_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg28_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg28_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg28_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg29' at address offset 0x74
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG29_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg29_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg29_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg29_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg29_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg29_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg29_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg29_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg29_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg29_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg29_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg29_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg29_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg29_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg29_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg29_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg29_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg29_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg29_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg29_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg29_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg29_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg29_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg29_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg29_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg29_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg29_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg29_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg29_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg29_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg29_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg29_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg29_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg29_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg30' at address offset 0x78
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG30_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg30_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg30_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg30_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg30_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg30_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg30_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg30_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg30_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg30_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg30_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg30_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg30_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg30_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg30_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg30_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg30_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg30_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg30_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg30_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg30_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg30_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg30_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg30_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg30_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg30_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg30_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg30_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg30_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg30_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg30_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg30_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg30_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg30_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    // register 'reg31' at address offset 0x7C
                    if (s_axi_awaddr_reg_r[AXI_ADDR_WIDTH-1:2] == BASEADDR[AXI_ADDR_WIDTH-1:2] + axi_regs_pkg::REG31_OFFSET[AXI_ADDR_WIDTH-1:2]) begin
                        v_addr_hit = 1'b1;
                        s_reg31_strobe_r <= 1'b1;
                        // field 'value':
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg31_value_r[0] <= s_axi_wdata_reg_r[0]; // value[0]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg31_value_r[1] <= s_axi_wdata_reg_r[1]; // value[1]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg31_value_r[2] <= s_axi_wdata_reg_r[2]; // value[2]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg31_value_r[3] <= s_axi_wdata_reg_r[3]; // value[3]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg31_value_r[4] <= s_axi_wdata_reg_r[4]; // value[4]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg31_value_r[5] <= s_axi_wdata_reg_r[5]; // value[5]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg31_value_r[6] <= s_axi_wdata_reg_r[6]; // value[6]
                        end
                        if (s_axi_wstrb_reg_r[0]) begin
                            s_reg_reg31_value_r[7] <= s_axi_wdata_reg_r[7]; // value[7]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg31_value_r[8] <= s_axi_wdata_reg_r[8]; // value[8]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg31_value_r[9] <= s_axi_wdata_reg_r[9]; // value[9]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg31_value_r[10] <= s_axi_wdata_reg_r[10]; // value[10]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg31_value_r[11] <= s_axi_wdata_reg_r[11]; // value[11]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg31_value_r[12] <= s_axi_wdata_reg_r[12]; // value[12]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg31_value_r[13] <= s_axi_wdata_reg_r[13]; // value[13]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg31_value_r[14] <= s_axi_wdata_reg_r[14]; // value[14]
                        end
                        if (s_axi_wstrb_reg_r[1]) begin
                            s_reg_reg31_value_r[15] <= s_axi_wdata_reg_r[15]; // value[15]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg31_value_r[16] <= s_axi_wdata_reg_r[16]; // value[16]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg31_value_r[17] <= s_axi_wdata_reg_r[17]; // value[17]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg31_value_r[18] <= s_axi_wdata_reg_r[18]; // value[18]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg31_value_r[19] <= s_axi_wdata_reg_r[19]; // value[19]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg31_value_r[20] <= s_axi_wdata_reg_r[20]; // value[20]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg31_value_r[21] <= s_axi_wdata_reg_r[21]; // value[21]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg31_value_r[22] <= s_axi_wdata_reg_r[22]; // value[22]
                        end
                        if (s_axi_wstrb_reg_r[2]) begin
                            s_reg_reg31_value_r[23] <= s_axi_wdata_reg_r[23]; // value[23]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg31_value_r[24] <= s_axi_wdata_reg_r[24]; // value[24]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg31_value_r[25] <= s_axi_wdata_reg_r[25]; // value[25]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg31_value_r[26] <= s_axi_wdata_reg_r[26]; // value[26]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg31_value_r[27] <= s_axi_wdata_reg_r[27]; // value[27]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg31_value_r[28] <= s_axi_wdata_reg_r[28]; // value[28]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg31_value_r[29] <= s_axi_wdata_reg_r[29]; // value[29]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg31_value_r[30] <= s_axi_wdata_reg_r[30]; // value[30]
                        end
                        if (s_axi_wstrb_reg_r[3]) begin
                            s_reg_reg31_value_r[31] <= s_axi_wdata_reg_r[31]; // value[31]
                        end
                    end

                    if (!v_addr_hit) begin
                        s_axi_bresp_r   <= AXI_DECERR;
                        // pragma translate_off
                        $warning("AWADDR decode error");
                        // pragma translate_on
                    end
                    v_state_r <= WRITE_DONE;
                end

                // Write transaction completed, wait for master BREADY to proceed
                WRITE_DONE: begin
                    if (s_axi_bready) begin
                        s_axi_bvalid_r <= 1'b0;
                        v_state_r      <= WRITE_IDLE;
                    end
                end
            endcase

            if (reg6_value_set) begin // pulsed to set the field 'reg6.value' to 1'b1
                s_reg_reg6_value_r <= '1;
            end

        end
    end: write_fsm

    //--------------------------------------------------------------------------
    // Outputs
    //
    assign s_axi_awready = s_axi_awready_r;
    assign s_axi_wready  = s_axi_wready_r;
    assign s_axi_bvalid  = s_axi_bvalid_r;
    assign s_axi_bresp   = s_axi_bresp_r;
    assign s_axi_arready = s_axi_arready_r;
    assign s_axi_rvalid  = s_axi_rvalid_r;
    assign s_axi_rlast   = s_axi_rlast_r;
    assign s_axi_rresp   = s_axi_rresp_r;
    assign s_axi_rdata   = s_axi_rdata_r;

    assign reg0_strobe = s_reg0_strobe_r;
    assign reg0_value = s_reg_reg0_value_r;
    assign reg1_strobe = s_reg1_strobe_r;
    assign reg1_value = s_reg_reg1_value_r;
    assign reg2_strobe = s_reg2_strobe_r;
    assign reg2_value = s_reg_reg2_value_r;
    assign reg3_strobe = s_reg3_strobe_r;
    assign reg3_value = s_reg_reg3_value_r;
    assign reg4_strobe = s_reg4_strobe_r;
    assign reg5_strobe = s_reg5_strobe_r;
    assign reg5_value = s_reg_reg5_value_r;
    assign reg7_strobe = s_reg7_strobe_r;
    assign reg7_value = s_reg_reg7_value_r;
    assign reg8_strobe = s_reg8_strobe_r;
    assign reg8_value = s_reg_reg8_value_r;
    assign reg9_strobe = s_reg9_strobe_r;
    assign reg9_value = s_reg_reg9_value_r;
    assign reg10_strobe = s_reg10_strobe_r;
    assign reg10_value = s_reg_reg10_value_r;
    assign reg11_strobe = s_reg11_strobe_r;
    assign reg11_value = s_reg_reg11_value_r;
    assign reg12_strobe = s_reg12_strobe_r;
    assign reg12_value = s_reg_reg12_value_r;
    assign reg13_strobe = s_reg13_strobe_r;
    assign reg13_value = s_reg_reg13_value_r;
    assign reg14_strobe = s_reg14_strobe_r;
    assign reg14_value = s_reg_reg14_value_r;
    assign reg15_strobe = s_reg15_strobe_r;
    assign reg15_value = s_reg_reg15_value_r;
    assign reg16_strobe = s_reg16_strobe_r;
    assign reg16_value = s_reg_reg16_value_r;
    assign reg17_strobe = s_reg17_strobe_r;
    assign reg17_value = s_reg_reg17_value_r;
    assign reg18_strobe = s_reg18_strobe_r;
    assign reg18_value = s_reg_reg18_value_r;
    assign reg19_strobe = s_reg19_strobe_r;
    assign reg19_value = s_reg_reg19_value_r;
    assign reg20_strobe = s_reg20_strobe_r;
    assign reg20_value = s_reg_reg20_value_r;
    assign reg21_strobe = s_reg21_strobe_r;
    assign reg21_value = s_reg_reg21_value_r;
    assign reg22_strobe = s_reg22_strobe_r;
    assign reg22_value = s_reg_reg22_value_r;
    assign reg23_strobe = s_reg23_strobe_r;
    assign reg23_value = s_reg_reg23_value_r;
    assign reg24_strobe = s_reg24_strobe_r;
    assign reg24_value = s_reg_reg24_value_r;
    assign reg25_strobe = s_reg25_strobe_r;
    assign reg25_value = s_reg_reg25_value_r;
    assign reg26_strobe = s_reg26_strobe_r;
    assign reg26_value = s_reg_reg26_value_r;
    assign reg27_strobe = s_reg27_strobe_r;
    assign reg27_value = s_reg_reg27_value_r;
    assign reg28_strobe = s_reg28_strobe_r;
    assign reg28_value = s_reg_reg28_value_r;
    assign reg29_strobe = s_reg29_strobe_r;
    assign reg29_value = s_reg_reg29_value_r;
    assign reg30_strobe = s_reg30_strobe_r;
    assign reg30_value = s_reg_reg30_value_r;
    assign reg31_strobe = s_reg31_strobe_r;
    assign reg31_value = s_reg_reg31_value_r;

endmodule: axi_regs

`resetall
