onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /tb_aes_core/DUT/aes_core_data_in
add wave -noupdate -expand -group {CREATE ROUND KEY} /tb_aes_core/DUT/crk_round_count
add wave -noupdate -expand -group {CREATE ROUND KEY} /tb_aes_core/DUT/crk_cipher_block
add wave -noupdate -expand -group {CREATE ROUND KEY} /tb_aes_core/DUT/crk_out_block
add wave -noupdate -expand -group {ADD ROUND KEY} /tb_aes_core/DUT/ark_data_in
add wave -noupdate -expand -group {ADD ROUND KEY} /tb_aes_core/DUT/ark_cipher_block
add wave -noupdate /tb_aes_core/DUT/ark_data_out
add wave -noupdate -expand -group CORE /tb_aes_core/DUT/tmp_data
add wave -noupdate -expand -group CORE /tb_aes_core/DUT/core_state
add wave -noupdate -expand -group CORE /tb_aes_core/DUT/clk
add wave -noupdate -expand -group CORE /tb_aes_core/DUT/reset_n
add wave -noupdate -expand -group CORE /tb_aes_core/DUT/valid_out
add wave -noupdate -expand -group {SBOX BLOCK} /tb_aes_core/DUT/sb_data_in
add wave -noupdate -expand -group {SBOX BLOCK} /tb_aes_core/DUT/sb_data_out
add wave -noupdate -group {SHIFT ROW} -expand /tb_aes_core/DUT/sr_data_in
add wave -noupdate -group {SHIFT ROW} -expand /tb_aes_core/DUT/sr_data_out
add wave -noupdate -expand -group {MIX COLUMN} /tb_aes_core/DUT/mc_data_in
add wave -noupdate -expand -group {MIX COLUMN} /tb_aes_core/DUT/mc_data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4710 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {15160 ps}
