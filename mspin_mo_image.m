// MSpin_* calculator, version 1, by Hassan Abdallah.
// This Magma program calculates an F_2-linear basis
//  for the spin-cobordism ring modulo 2, \alpha, \eta, and the Bott
//  element, in a range of degrees, using element names 
//  which make it possible
//  to see the multiplicative structure. (It is this last
//  point which is new. If you don't care about 
//  the multiplicative structure on the spin-cobordism
//  ring, you could get an F_2-linear basis more easily
//  using Poincare series and the Anderson-Brown-Peterson
//  splitting.)
//
// For explanation of what this code does, why it works,
//  and results, see the paper "Products in spin^c 
//  cobordism," joint with Andrew Salch.
//
// The output is a list of non-dyadic partitions. 
//  Each such partition \lambda determines an element 
//  P_\lambda in Thom's partition basis for the 
//  unoriented bordism ring MO_*. The partitions in the 
//  output yield an F_2-linear basis for the image of the
//  map MSpin_* -> MO_* through the specified maximum
//  grading degree. For example, [ 5, 5, 2, 2] 
//  refers to Thom's element P_{5,5,2,2}, i.e., 
//  x_5^2 times x_2^2, if you are thinking of MO_* as
//  F_2[x_2,x_4,x_5,x_6,x_8,...].
//  Along with each non-dyadic partition, a dual
//  element in cohomology, written in terms of Stiefel-
//  Whitney classes, is also displayed.
//
// For comments on what the functions in this script 
// do, see the file mspinc_mo_image.m 
//
// The parameter which the user is most likely to
//  modify is this one, max_def, which is the maximum 
//  grading degree in which to compute the image of the
//  map MSpin_* -> MO_* 
max_deg:=24;


bso<w_2,w_3,w_4,w_5,w_6,w_7,w_8,w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34>
  := PolynomialRing(GF(2),[2..34]);

spin_rels := [w_2,w_3,w_2*w_3+w_5,w_9+w_2*w_7,w_2^7*w_3 + w_2^4*w_3^3 + w_2*w_3^5 + w_2^6*w_5 + w_3^4*w_5 + w_2^4*w_4*w_5 + w_4^3*w_5 + w_3*w_4*w_5^2 + w_2*w_5^3 + w_2^4*w_3*w_6 + w_3*w_4^2*w_6 + w_3^2*w_5*w_6 + w_2*w_3*w_6^2 + w_5*w_6^2 + w_2^5*w_7 + w_3^2*w_4*w_7 + w_2*w_4^2*w_7 + w_5^2*w_7 + w_2^2*w_6*w_7 + w_3*w_7^2 + w_3^3*w_8 + w_2^2*w_5*w_8 +  w_2^4*w_9 + w_2*w_3^2*w_9 + w_2^2*w_4*w_9 + w_4^2*w_9 + w_8*w_9 + w_2^2*w_3*w_10 + w_7*w_10 + w_2^3*w_11 + w_3^2*w_11 + w_6*w_11 + w_5*w_12 + w_2^2*w_13 + w_4*w_13 + w_3*w_14 + w_2*w_15 + w_17,w_2^15*w_3 + w_2^12*w_3^3 + w_2^9*w_3^5 + w_2^3*w_3^9 + w_3^11 + w_2^14*w_5 + w_2^8*w_3^4*w_5 + w_2^2*w_3^8*w_5 + w_2^12*w_4*w_5 + w_3^8*w_4*w_5 + w_2^8*w_4^3*w_5 + w_4^7*w_5 + w_2^8*w_3*w_4*w_5^2 +
    w_3*w_4^5*w_5^2 + w_2^9*w_5^3 + w_2*w_4^4*w_5^3 + w_3^3*w_4*w_5^4 + w_2*w_3*w_4^2*w_5^4 + w_2*w_3^2*w_5^5 + w_2^2*w_4*w_5^5 + w_4^2*w_5^5 + w_3*w_5^6 + w_2^12*w_3*w_6 + w_3^9*w_6 +
    w_2^8*w_3*w_4^2*w_6 + w_3*w_4^6*w_6 + w_2^8*w_3^2*w_5*w_6 + w_3^2*w_4^4*w_5*w_6 + w_3^4*w_5^3*w_6 + w_2^2*w_3*w_5^4*w_6 + w_2^9*w_3*w_6^2 + w_2*w_3*w_4^4*w_6^2 + w_2^8*w_5*w_6^2 +
    w_3^4*w_4*w_5*w_6^2 + w_4^4*w_5*w_6^2 + w_3^5*w_6^3 + w_2^3*w_3*w_6^4 + w_3^3*w_6^4 + w_2^2*w_5*w_6^4 + w_4*w_5*w_6^4 + w_3*w_6^5 + w_2^13*w_7 + w_2*w_3^8*w_7 + w_2^8*w_3^2*w_4*w_7 +
    w_2^9*w_4^2*w_7 + w_3^2*w_4^5*w_7 + w_2*w_4^6*w_7 + w_2^8*w_5^2*w_7 + w_3^4*w_4*w_5^2*w_7 + w_4^4*w_5^2*w_7 + w_2^3*w_5^4*w_7 + w_3^2*w_5^4*w_7 + w_2^10*w_6*w_7 + w_3^4*w_4^2*w_6*w_7 +
    w_2^2*w_4^4*w_6*w_7 + w_5^4*w_6*w_7 + w_2*w_3^4*w_6^2*w_7 + w_2^4*w_6^3*w_7 + w_2*w_6^4*w_7 + w_2^8*w_3*w_7^2 + w_3^5*w_4*w_7^2 + w_3*w_4^4*w_7^2 + w_2*w_3^4*w_5*w_7^2 + w_2^4*w_5*w_6*w_7^2 +
    w_3^4*w_7^3 + w_2^4*w_4*w_7^3 + w_2*w_3*w_7^4 + w_5*w_7^4 + w_2^8*w_3^3*w_8 + w_3^3*w_4^4*w_8 + w_2^10*w_5*w_8 + w_3^4*w_4^2*w_5*w_8 + w_2^2*w_4^4*w_5*w_8 + w_3^5*w_5^2*w_8 + w_5^5*w_8 +
    w_2^4*w_5*w_6^2*w_8 + w_3^6*w_7*w_8 + w_2^4*w_5^2*w_7*w_8 + w_2^4*w_3*w_7^2*w_8 + w_2*w_3^5*w_8^2 + w_3^4*w_5*w_8^2 + w_2^4*w_4*w_5*w_8^2 + w_2^4*w_3*w_6*w_8^2 + w_2^5*w_7*w_8^2 + w_2^12*w_9 +
    w_2^9*w_3^2*w_9 + w_3^8*w_9 + w_2^10*w_4*w_9 + w_2^8*w_4^2*w_9 + w_3^4*w_4^3*w_9 + w_2*w_3^2*w_4^4*w_9 + w_2^2*w_4^5*w_9 + w_4^6*w_9 + w_2*w_3^4*w_5^2*w_9 + w_2^2*w_5^4*w_9 + w_4*w_5^4*w_9 +    w_3^6*w_6*w_9 + w_2^4*w_5^2*w_6*w_9 + w_3^4*w_6^2*w_9 + w_2^4*w_4*w_6^2*w_9 + w_6^4*w_9 + w_2^5*w_7^2*w_9 + w_2^8*w_8*w_9 + w_2^2*w_3^4*w_8*w_9 + w_2^4*w_4^2*w_8*w_9 + w_4^4*w_8*w_9 +
    w_2^4*w_8^2*w_9 + w_8^3*w_9 + w_3^5*w_9^2 + w_2^4*w_3*w_4*w_9^2 + w_2^5*w_5*w_9^2 + w_2^4*w_7*w_9^2 + w_7*w_8*w_9^2 + w_6*w_9^3 + w_2^10*w_3*w_10 + w_3^5*w_4^2*w_10 + w_2^2*w_3*w_4^4*w_10 +
    w_3^6*w_5*w_10 + w_2^4*w_5^3*w_10 + w_3*w_5^4*w_10 + w_2^4*w_3*w_6^2*w_10 + w_2^8*w_7*w_10 + w_2^2*w_3^4*w_7*w_10 + w_2^4*w_4^2*w_7*w_10 + w_4^4*w_7*w_10 + w_7*w_8^2*w_10 + w_2^4*w_3^2*w_9*w_10 +
    w_7^2*w_9*w_10 + w_5*w_9^2*w_10 + w_2^5*w_3*w_10^2 + w_2^4*w_5*w_10^2 + w_6*w_7*w_10^2 + w_5*w_8*w_10^2 + w_4*w_9*w_10^2 + w_3*w_10^3 + w_2^11*w_11 + w_2^8*w_3^2*w_11 + w_3^6*w_4*w_11 +
    w_2*w_3^4*w_4^2*w_11 + w_2^3*w_4^4*w_11 + w_3^2*w_4^4*w_11 + w_3^4*w_5^2*w_11 + w_2^4*w_4*w_5^2*w_11 + w_2*w_5^4*w_11 + w_2^8*w_6*w_11 + w_2^2*w_3^4*w_6*w_11 + w_2^4*w_4^2*w_6*w_11 +
    w_4^4*w_6*w_11 + w_2^5*w_6^2*w_11 + w_2^4*w_7^2*w_11 + w_2^4*w_3^2*w_8*w_11 + w_7^2*w_8*w_11 + w_6*w_8^2*w_11 + w_4*w_9^2*w_11 + w_2^6*w_10*w_11 + w_3^4*w_10*w_11 + w_6^2*w_10*w_11 +
    w_2*w_10^2*w_11 + w_2^4*w_3*w_11^2 + w_5*w_6*w_11^2 + w_4*w_7*w_11^2 + w_3*w_8*w_11^2 + w_2*w_9*w_11^2 + w_11^3 + w_3^7*w_12 + w_2^8*w_5*w_12 + w_2^2*w_3^4*w_5*w_12 + w_2^4*w_4^2*w_5*w_12 +
    w_4^4*w_5*w_12 + w_2^4*w_3*w_5^2*w_12 + w_2^4*w_3^2*w_7*w_12 + w_7^3*w_12 + w_5*w_8^2*w_12 + w_2^6*w_9*w_12 + w_3^4*w_9*w_12 + w_6^2*w_9*w_12 + w_3*w_9^2*w_12 + w_5^2*w_11*w_12 + w_4*w_5*w_12^2 +
    w_3*w_6*w_12^2 + w_2*w_7*w_12^2 + w_9*w_12^2 + w_2^10*w_13 + w_2*w_3^6*w_13 + w_2^8*w_4*w_13 + w_2^2*w_3^4*w_4*w_13 + w_3^4*w_4^2*w_13 + w_2^4*w_4^3*w_13 + w_2^2*w_4^4*w_13 + w_4^5*w_13 + w_2^5*w_5^2*w_13 + w_5^4*w_13 + w_2^4*w_3^2*w_6*w_13 + w_2^4*w_6^2*w_13 + w_6*w_7^2*w_13 + w_2^6*w_8*w_13 + w_3^4*w_8*w_13 + w_6^2*w_8*w_13 + w_4*w_8^2*w_13 + w_2*w_9^2*w_13 + w_5^2*w_10*w_13 + w_10^2*w_13 + w_2^4*w_12*w_13 + w_4^2*w_12*w_13 + w_3*w_4*w_13^2 + w_2*w_5*w_13^2 + w_7*w_13^2 + w_2^8*w_3*w_14 + w_2^2*w_3^5*w_14 + w_2^4*w_3*w_4^2*w_14 + w_3*w_4^4*w_14 + w_2^4*w_3^2*w_5*w_14 + w_2^6*w_7*w_14 + w_3^4*w_7*w_14 + w_6^2*w_7*w_14 + w_5*w_7^2*w_14 + w_3*w_8^2*w_14 + w_5^2*w_9*w_14 + w_2^4*w_11*w_14 + w_4^2*w_11*w_14 + w_3^2*w_13*w_14 + w_2*w_3*w_14^2 + w_5*w_14^2 + w_2^9*w_15 + w_2^3*w_3^4*w_15 + w_3^6*w_15 + w_2^4*w_3^2*w_4*w_15 + w_2^5*w_4^2*w_15 + w_2*w_4^4*w_15 + w_2^4*w_5^2*w_15 + w_2^6*w_6*w_15 + w_3^4*w_6*w_15 + w_6^3*w_15 + w_4*w_7^2*w_15 + w_5^2*w_8*w_15 + w_2*w_8^2*w_15 + w_9^2*w_15 + w_2^4*w_10*w_15 + w_4^2*w_10*w_15 + w_3^2*w_12*w_15 + w_2^2*w_14*w_15 + w_3*w_15^2 + w_2^4*w_3^3*w_16 + w_2^6*w_5*w_16 + w_3^4*w_5*w_16 + w_5*w_6^2*w_16 + w_5^2*w_7*w_16 + w_3*w_7^2*w_16 + w_2^4*w_9*w_16 + w_4^2*w_9*w_16 + w_3^2*w_11*w_16 + w_2^2*w_13*w_16 + w_2^8*w_17 + w_2^5*w_3^2*w_17 + w_2^2*w_3^4*w_17 + w_2^6*w_4*w_17 + w_3^4*w_4*w_17 + w_2^4*w_4^2*w_17 + w_4^4*w_17 + w_5^2*w_6*w_17 + w_4*w_6^2*w_17 + w_2*w_7^2*w_17 + w_2^4*w_8*w_17 + w_4^2*w_8*w_17 + w_8^2*w_17 + w_3^2*w_10*w_17 + w_2^2*w_12*w_17 + w_16*w_17 + w_2^6*w_3*w_18 + w_3^5*w_18 + w_5^3*w_18 + w_3*w_6^2*w_18 + w_2^4*w_7*w_18 + w_4^2*w_7*w_18 + w_3^2*w_9*w_18 + w_2^2*w_11*w_18 + w_15*w_18];

bspin<w_2_0,w_3_0,w_4_0,w_5_0,w_6_0,w_7_0,w_8_0,w_9_0,w_10_0,w_11_0,w_12_0,w_13_0,w_14_0,w_15_0,w_16_0,w_17_0,w_18_0,w_19_0,w_20_0,w_21_0,w_22_0,w_23_0,w_24_0,w_25_0,w_26_0,w_27_0,w_28_0,w_29_0,w_30_0,w_31_0,w_32_0,w_33_0,w_34_0> := quo< bso | spin_rels>; 

bso_gens :=[w_2,w_3,w_4,w_5,w_6,w_7,w_8,w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34];

bspin_gens :=[w_2_0,w_3_0,w_4_0,w_5_0,w_6_0,w_7_0,w_8_0,w_9_0,w_10_0,w_11_0,w_12_0,w_13_0,w_14_0,w_15_0,w_16_0,w_17_0,w_18_0,w_19_0,w_20_0,w_21_0,w_22_0,w_23_0,w_24_0,w_25_0,w_26_0,w_27_0,w_28_0,w_29_0,w_30_0,w_31_0,w_32_0,w_33_0,w_34_0];



ws := [bso!1, bso!0, w_2, w_3, w_4, w_5, w_6, w_7, w_8,
        w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34];


function w(i)
  if i gt 34 then return bso!0;
  else return ws[i+1];
  end if;
end function;

function Wu(i,j)
   return &+[ Binomial(t+j-i-1,t) * w(i-t)*w(j+t) 
              : t in [0..i]];
	end function;

P<t> := PolynomialRing(bso);

SqT := hom<bso->P |
        [ &+[t^i * Wu(i,j) : i in [0..j]]
         : j in [2..34]]>;

function Sqi(ii,xx)
  co := Coefficients(SqT(xx));
  if ii ge #co then return bso!0;
  else return co[ii+1];
  end if;
end function;

function SqU(ii,xx)
    if xx eq 0 then return 0;
    else return &+[Sqi(t,xx)*w(ii-t)
              : t in [0..ii]];
    end if;
end function;


function Qi(ii,xx)
    if ii eq 1 then return SqU(1,xx);
    else return SqU(3,xx)+SqU(2,SqU(1,xx));
    end if;
end function;


function propogate(x) 
d := max_deg-Degree(x);
sq_im := [];
master := [];
ind := 1;
m_ind := 1; 
for i in [1..d] do
        sq_val_0 := Evaluate(SqU(i,x),bspin_gens);
        sq_val := Evaluate(sq_val_0,bso_gens);
        if sq_val ne 0 then
        sq_im[ind] := sq_val;
        master[m_ind] := sq_val;
        ind := ind + 1;
        m_ind := m_ind + 1;
end if;
end for;

sq_im_len := # sq_im;
for i in [1..sq_im_len] do
        d := max_deg-Degree(sq_im[i]);
        non_0 := 0;
        restart := # master;
        for j in [1..d] do
                sq_val_0 := Evaluate(SqU(j,sq_im[i]),bspin_gens);
                sq_val := Evaluate(sq_val_0,bso_gens);
                if sq_val ne 0 then
                non_0 := non_0 + 1;
                master[m_ind] := sq_val;
                m_ind := m_ind + 1;
                end if;
                while non_0 gt 0 do
                        master_len := # master;
                        non_0 := 0;
                        for k in [restart..master_len] do
                        restart := master_len;
                        d := max_deg-Degree(master[k]);
                        for l in [1..d] do
                        sq_val_0 := Evaluate(SqU(l,master[k]),bspin_gens);
                        sq_val := Evaluate(sq_val_0,bso_gens);
                        if sq_val ne 0 then
                        non_0 := non_0+1;
                        master[m_ind] := sq_val;
                        m_ind := m_ind+1;
                        end if;
                        end for;
                        end for;
                        end while;
end for;
end for;
return(master); 
end function;

function symm_base_change(deg)
        b := []; 
        for i in [1..# Partitions(deg)] do
                b[i] := &*[w(Partitions(deg)[i][j]) :j in [1..# Partitions(deg)[i]]];

        end for; 

Z := Matrix(bso,# Partitions(deg), 1, b); 
tmat := MonomialToElementaryMatrix(deg);
vals := [];

for i in [1..# Rows(tmat)] do
for j in [1.. # Rows(tmat)] do
Append(~vals,tmat[i,j]);
end for;
end for;

tmat_T := Matrix(bso,# Partitions(deg),# Partitions(deg),vals);


return(tmat_T*Z);
end function;

function mspin_mo_image(deg, D_n)
        parts := Partitions(deg);
        parts_nondy := [];
        gens := [];
        for i in [1..# parts] do
                 if 1 in parts[i] or 3 in parts[i] or 7 in parts[i] or 15 in parts[i] or 31 in parts[i] then continue;
                else Append(~parts_nondy, i);
                end if;
                end for;

	rels := [];
        for i in [1..# D_n] do
        if Degree(D_n[i]) eq deg then Append(~rels,D_n[i]);
        end if;
        end for;
        
        		T<t_2_0,t_3_0,t_4_0,t_5_0,t_6_0,t_7_0,t_8_0,t_9_0,t_10_0,t_11_0,t_12_0,t_13_0,t_14_0,t_15_0,t_16_0,t_17_0,t_18_0,t_19_0,t_20_0,t_21_0,t_22_0,t_23_0,t_24_0,t_25_0,t_26_0,t_27_0,t_28_0,t_29_0,t_30_0,t_31_0,t_32_0,t_33_0,t_34_0> := quo< bspin | rels>;

	base_polys := symm_base_change(deg); 
        for i in [1..# parts_nondy] do
        x := base_polys[parts_nondy[i]];
        val_t := Evaluate(x,[t_2_0,t_3_0,t_4_0,t_5_0,t_6_0,t_7_0,t_8_0,t_9_0,t_10_0,t_11_0,t_12_0,t_13_0,t_14_0,t_15_0,t_16_0,t_17_0,t_18_0,t_19_0,t_20_0,t_21_0,t_22_0,t_23_0,t_24_0,t_25_0,t_26_0,t_27_0,t_28_0,t_29_0,t_30_0,t_31_0,t_32_0,t_33_0,t_34_0]);
        val_tt := Evaluate(val_t,bso_gens);
        if val_tt ne 0 then
        print(parts[parts_nondy[i]]);
        print(val_tt);
        end if;
        end for;
return "";
end function;



D := [];

for i in [2..max_deg] do 
	if Evaluate(w(i),bspin_gens) ne 0 then
	Append(~D, w(i));
	prop_i := propogate(w(i));
	for j in [1..# prop_i] do 
		Append(~D, prop_i[j]);
	end for;
	end if;
end for; 

for a in [2..max_deg] do 

b_deg := [];
ind_deg := 1;
deg := a;

for i in [1..# D] do
	if Degree(D[i]) eq deg then Append(~b_deg, D[i]);
	end if;
end for; 

vspace := VectorSpace(GF(2), # MonomialsOfWeightedDegree(bso,deg)); 

q := [];
m_deg := MonomialsOfWeightedDegree(bso,deg);
for i in [1..# MonomialsOfWeightedDegree(bso,deg)] do 
	val_q := Evaluate(m_deg[i],bspin_gens);
	val_r := Evaluate(val_q,bso_gens);
	if val_r ne m_deg[i] then 
	Append(~b_deg,m_deg[i] + val_r);
	end if;
end for;


basis_vspace := Basis(vspace);
for i in [1..# b_deg] do 
	q[i] := &+[vspace!0+basis_vspace[Position(MonomialsOfWeightedDegree(bso,deg),Terms(b_deg[i])[j])] :j in [1..# Terms(b_deg[i])]];
end for; 
S := sub<vspace | q>;
B := Complement(vspace,S);
basis_len := # Basis(B);
if basis_len gt 0 then
	mspin_mo_image(a,D);
	for p in [1..# Basis(B)] do
		r_val := &+[Basis(B)[p][i]*MonomialsOfWeightedDegree(bso,deg)[i] :i in  [1..# MonomialsOfWeightedDegree(bso,deg)]];
		prop_r := propogate(r_val); 
	for v in [1..# prop_r] do
	Append(~D,prop_r[v]); 
end for;
end for;
end if;
q_deg := quo<vspace | q>; 
end for;
exit;
