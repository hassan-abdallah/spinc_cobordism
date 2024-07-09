# $`Spin^c`$ Cobordism

This repository contains the Magma scripts used in the paper "Products in $`Spin^c`$ Cobordism" to calculate the images of the maps $`MSpin^c_* \rightarrow MO_{*}`$ and $`MSpin_* \rightarrow MO_{*}`$. 

The variable max_deg sets the maximum degree the calculation is carried out to. For each degree up to max_deg, the output is a list of partitions $\lambda$ such that the dual element $Y_{\lambda}$ of $P_{\lambda}U \in H^{*}(MO;\mathbb{F}_{2})$ is in the image of the corresponding map (see the proof of Proposition 3.1). Below each partition is the polynomial $`P_{\lambda}U`$ (omitting the U) modulo $`w_1`$, the relations of $`H^*(MSpin^{c}_{*}; \mathbb{F}_{2}`$), and the $`A`$-module decomposables in the same degree as $`P_{\lambda}U`$. If multiple partitions have the same polynomial printed below them, the sum of their dual elements is in the image. 
