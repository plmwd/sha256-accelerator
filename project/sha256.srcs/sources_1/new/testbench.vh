task sync_pos;
begin
    @(posedge clk_t);
end
endtask

task sync_neg;
begin
    @(negedge clk_t);
end
endtask