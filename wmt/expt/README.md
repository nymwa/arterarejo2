# wmt/expt

## example of sub.yaml (under deen/, ende/, ...)

```
group: ???
train:
   h_rt: 4:0:0
   node: rt_F # V100 x 4
   num_node: 16
   gpu_per_node: 4
   port: ???
generate:
   h_rt: 0:10:0
score:
   h_rt: 0:10:0
```

