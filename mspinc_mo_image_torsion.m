max_deg:=24;

R<w_2,w_3,w_4,w_5,w_6,w_7,w_8,w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34>
  := PolynomialRing(GF(2),[2..34]);

spinc_rels := [w_3,w_5,w_9+w_2*w_7,w_2^7*w_3 + w_2^4*w_3^3 + w_2*w_3^5 + w_2^6*w_5 + w_3^4*w_5 + w_2^4*w_4*w_5 + w_4^3*w_5 + w_3*w_4*w_5^2 + w_2*w_5^3 + w_2^4*w_3*w_6 + w_3*w_4^2*w_6 + w_3^2*w_5*w_6 + w_2*w_3*w_6^2 + w_5*w_6^2 + w_2^5*w_7 + w_3^2*w_4*w_7 + w_2*w_4^2*w_7 + w_5^2*w_7 + w_2^2*w_6*w_7 + w_3*w_7^2 + w_3^3*w_8 + w_2^2*w_5*w_8 +  w_2^4*w_9 + w_2*w_3^2*w_9 + w_2^2*w_4*w_9 + w_4^2*w_9 + w_8*w_9 + w_2^2*w_3*w_10 + w_7*w_10 + w_2^3*w_11 + w_3^2*w_11 + w_6*w_11 + w_5*w_12 + w_2^2*w_13 + w_4*w_13 + w_3*w_14 + w_2*w_15 + w_17,w_2^15*w_3 + w_2^12*w_3^3 + w_2^9*w_3^5 + w_2^3*w_3^9 + w_3^11 + w_2^14*w_5 + w_2^8*w_3^4*w_5 + w_2^2*w_3^8*w_5 + w_2^12*w_4*w_5 + w_3^8*w_4*w_5 + w_2^8*w_4^3*w_5 + w_4^7*w_5 + w_2^8*w_3*w_4*w_5^2 +
    w_3*w_4^5*w_5^2 + w_2^9*w_5^3 + w_2*w_4^4*w_5^3 + w_3^3*w_4*w_5^4 + w_2*w_3*w_4^2*w_5^4 + w_2*w_3^2*w_5^5 + w_2^2*w_4*w_5^5 + w_4^2*w_5^5 + w_3*w_5^6 + w_2^12*w_3*w_6 + w_3^9*w_6 +
    w_2^8*w_3*w_4^2*w_6 + w_3*w_4^6*w_6 + w_2^8*w_3^2*w_5*w_6 + w_3^2*w_4^4*w_5*w_6 + w_3^4*w_5^3*w_6 + w_2^2*w_3*w_5^4*w_6 + w_2^9*w_3*w_6^2 + w_2*w_3*w_4^4*w_6^2 + w_2^8*w_5*w_6^2 +
    w_3^4*w_4*w_5*w_6^2 + w_4^4*w_5*w_6^2 + w_3^5*w_6^3 + w_2^3*w_3*w_6^4 + w_3^3*w_6^4 + w_2^2*w_5*w_6^4 + w_4*w_5*w_6^4 + w_3*w_6^5 + w_2^13*w_7 + w_2*w_3^8*w_7 + w_2^8*w_3^2*w_4*w_7 +
    w_2^9*w_4^2*w_7 + w_3^2*w_4^5*w_7 + w_2*w_4^6*w_7 + w_2^8*w_5^2*w_7 + w_3^4*w_4*w_5^2*w_7 + w_4^4*w_5^2*w_7 + w_2^3*w_5^4*w_7 + w_3^2*w_5^4*w_7 + w_2^10*w_6*w_7 + w_3^4*w_4^2*w_6*w_7 +
    w_2^2*w_4^4*w_6*w_7 + w_5^4*w_6*w_7 + w_2*w_3^4*w_6^2*w_7 + w_2^4*w_6^3*w_7 + w_2*w_6^4*w_7 + w_2^8*w_3*w_7^2 + w_3^5*w_4*w_7^2 + w_3*w_4^4*w_7^2 + w_2*w_3^4*w_5*w_7^2 + w_2^4*w_5*w_6*w_7^2 +
    w_3^4*w_7^3 + w_2^4*w_4*w_7^3 + w_2*w_3*w_7^4 + w_5*w_7^4 + w_2^8*w_3^3*w_8 + w_3^3*w_4^4*w_8 + w_2^10*w_5*w_8 + w_3^4*w_4^2*w_5*w_8 + w_2^2*w_4^4*w_5*w_8 + w_3^5*w_5^2*w_8 + w_5^5*w_8 +
    w_2^4*w_5*w_6^2*w_8 + w_3^6*w_7*w_8 + w_2^4*w_5^2*w_7*w_8 + w_2^4*w_3*w_7^2*w_8 + w_2*w_3^5*w_8^2 + w_3^4*w_5*w_8^2 + w_2^4*w_4*w_5*w_8^2 + w_2^4*w_3*w_6*w_8^2 + w_2^5*w_7*w_8^2 + w_2^12*w_9 +
    w_2^9*w_3^2*w_9 + w_3^8*w_9 + w_2^10*w_4*w_9 + w_2^8*w_4^2*w_9 + w_3^4*w_4^3*w_9 + w_2*w_3^2*w_4^4*w_9 + w_2^2*w_4^5*w_9 + w_4^6*w_9 + w_2*w_3^4*w_5^2*w_9 + w_2^2*w_5^4*w_9 + w_4*w_5^4*w_9 +
    w_3^6*w_6*w_9 + w_2^4*w_5^2*w_6*w_9 + w_3^4*w_6^2*w_9 + w_2^4*w_4*w_6^2*w_9 + w_6^4*w_9 + w_2^5*w_7^2*w_9 + w_2^8*w_8*w_9 + w_2^2*w_3^4*w_8*w_9 + w_2^4*w_4^2*w_8*w_9 + w_4^4*w_8*w_9 +
    w_2^4*w_8^2*w_9 + w_8^3*w_9 + w_3^5*w_9^2 + w_2^4*w_3*w_4*w_9^2 + w_2^5*w_5*w_9^2 + w_2^4*w_7*w_9^2 + w_7*w_8*w_9^2 + w_6*w_9^3 + w_2^10*w_3*w_10 + w_3^5*w_4^2*w_10 + w_2^2*w_3*w_4^4*w_10 +
    w_3^6*w_5*w_10 + w_2^4*w_5^3*w_10 + w_3*w_5^4*w_10 + w_2^4*w_3*w_6^2*w_10 + w_2^8*w_7*w_10 + w_2^2*w_3^4*w_7*w_10 + w_2^4*w_4^2*w_7*w_10 + w_4^4*w_7*w_10 + w_7*w_8^2*w_10 + w_2^4*w_3^2*w_9*w_10 +
    w_7^2*w_9*w_10 + w_5*w_9^2*w_10 + w_2^5*w_3*w_10^2 + w_2^4*w_5*w_10^2 + w_6*w_7*w_10^2 + w_5*w_8*w_10^2 + w_4*w_9*w_10^2 + w_3*w_10^3 + w_2^11*w_11 + w_2^8*w_3^2*w_11 + w_3^6*w_4*w_11 +
    w_2*w_3^4*w_4^2*w_11 + w_2^3*w_4^4*w_11 + w_3^2*w_4^4*w_11 + w_3^4*w_5^2*w_11 + w_2^4*w_4*w_5^2*w_11 + w_2*w_5^4*w_11 + w_2^8*w_6*w_11 + w_2^2*w_3^4*w_6*w_11 + w_2^4*w_4^2*w_6*w_11 +
    w_4^4*w_6*w_11 + w_2^5*w_6^2*w_11 + w_2^4*w_7^2*w_11 + w_2^4*w_3^2*w_8*w_11 + w_7^2*w_8*w_11 + w_6*w_8^2*w_11 + w_4*w_9^2*w_11 + w_2^6*w_10*w_11 + w_3^4*w_10*w_11 + w_6^2*w_10*w_11 +
    w_2*w_10^2*w_11 + w_2^4*w_3*w_11^2 + w_5*w_6*w_11^2 + w_4*w_7*w_11^2 + w_3*w_8*w_11^2 + w_2*w_9*w_11^2 + w_11^3 + w_3^7*w_12 + w_2^8*w_5*w_12 + w_2^2*w_3^4*w_5*w_12 + w_2^4*w_4^2*w_5*w_12 +
    w_4^4*w_5*w_12 + w_2^4*w_3*w_5^2*w_12 + w_2^4*w_3^2*w_7*w_12 + w_7^3*w_12 + w_5*w_8^2*w_12 + w_2^6*w_9*w_12 + w_3^4*w_9*w_12 + w_6^2*w_9*w_12 + w_3*w_9^2*w_12 + w_5^2*w_11*w_12 + w_4*w_5*w_12^2 +
    w_3*w_6*w_12^2 + w_2*w_7*w_12^2 + w_9*w_12^2 + w_2^10*w_13 + w_2*w_3^6*w_13 + w_2^8*w_4*w_13 + w_2^2*w_3^4*w_4*w_13 + w_3^4*w_4^2*w_13 + w_2^4*w_4^3*w_13 + w_2^2*w_4^4*w_13 + w_4^5*w_13 + w_2^5*w_5^2*w_13 + w_5^4*w_13 + w_2^4*w_3^2*w_6*w_13 + w_2^4*w_6^2*w_13 + w_6*w_7^2*w_13 + w_2^6*w_8*w_13 + w_3^4*w_8*w_13 + w_6^2*w_8*w_13 + w_4*w_8^2*w_13 + w_2*w_9^2*w_13 + w_5^2*w_10*w_13 + w_10^2*w_13 + w_2^4*w_12*w_13 + w_4^2*w_12*w_13 + w_3*w_4*w_13^2 + w_2*w_5*w_13^2 + w_7*w_13^2 + w_2^8*w_3*w_14 + w_2^2*w_3^5*w_14 + w_2^4*w_3*w_4^2*w_14 + w_3*w_4^4*w_14 + w_2^4*w_3^2*w_5*w_14 + w_2^6*w_7*w_14 + w_3^4*w_7*w_14 + w_6^2*w_7*w_14 + w_5*w_7^2*w_14 + w_3*w_8^2*w_14 + w_5^2*w_9*w_14 + w_2^4*w_11*w_14 + w_4^2*w_11*w_14 + w_3^2*w_13*w_14 + w_2*w_3*w_14^2 + w_5*w_14^2 + w_2^9*w_15 + w_2^3*w_3^4*w_15 + w_3^6*w_15 + w_2^4*w_3^2*w_4*w_15 + w_2^5*w_4^2*w_15 + w_2*w_4^4*w_15 + w_2^4*w_5^2*w_15 + w_2^6*w_6*w_15 + w_3^4*w_6*w_15 + w_6^3*w_15 + w_4*w_7^2*w_15 + w_5^2*w_8*w_15 + w_2*w_8^2*w_15 + w_9^2*w_15 + w_2^4*w_10*w_15 + w_4^2*w_10*w_15 + w_3^2*w_12*w_15 + w_2^2*w_14*w_15 + w_3*w_15^2 + w_2^4*w_3^3*w_16 + w_2^6*w_5*w_16 + w_3^4*w_5*w_16 + w_5*w_6^2*w_16 + w_5^2*w_7*w_16 + w_3*w_7^2*w_16 + w_2^4*w_9*w_16 + w_4^2*w_9*w_16 + w_3^2*w_11*w_16 + w_2^2*w_13*w_16 + w_2^8*w_17 + w_2^5*w_3^2*w_17 + w_2^2*w_3^4*w_17 + w_2^6*w_4*w_17 + w_3^4*w_4*w_17 + w_2^4*w_4^2*w_17 + w_4^4*w_17 + w_5^2*w_6*w_17 + w_4*w_6^2*w_17 + w_2*w_7^2*w_17 + w_2^4*w_8*w_17 + w_4^2*w_8*w_17 + w_8^2*w_17 + w_3^2*w_10*w_17 + w_2^2*w_12*w_17 + w_16*w_17 + w_2^6*w_3*w_18 + w_3^5*w_18 + w_5^3*w_18 + w_3*w_6^2*w_18 + w_2^4*w_7*w_18 + w_4^2*w_7*w_18 + w_3^2*w_9*w_18 + w_2^2*w_11*w_18 + w_15*w_18]; 


Q<w_2_0,w_3_0,w_4_0,w_5_0,w_6_0,w_7_0,w_8_0,w_9_0,w_10_0,w_11_0,w_12_0,w_13_0,w_14_0,w_15_0,w_16_0,w_17_0,w_18_0,w_19_0,w_20_0,w_21_0,w_22_0,w_23_0,w_24_0,w_25_0,w_26_0,w_27_0,w_28_0,w_29_0,w_30_0,w_31_0,w_32_0,w_33_0,w_34_0> := quo< R | spinc_rels>; 


ws := [R!1, R!0, w_2, w_3, w_4, w_5, w_6, w_7, w_8,
        w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34];

function w(i)
  if i gt 34 then return R!0;
  else return ws[i+1];
  end if;
end function;

function Wu(i,j)
   return &+[ Binomial(t+j-i-1,t) * w(i-t)*w(j+t) 
              : t in [0..i]];
	end function;

P<t> := PolynomialRing(R);

SqT := hom<R->P |
        [ &+[t^i * Wu(i,j) : i in [0..j]]
         : j in [2..34]]>;

function Sqi(ii,xx)
  co := Coefficients(SqT(xx));
  if ii ge #co then return R!0;
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
        sq_val_0 := Evaluate(SqU(i,x),[w_2_0,w_3_0,w_4_0,w_5_0,w_6_0,w_7_0,w_8_0,w_9_0,w_10_0,w_11_0,w_12_0,w_13_0,w_14_0,w_15_0,w_16_0,w_17_0,w_18_0,w_19_0,w_20_0,w_21_0,w_22_0,w_23_0,w_24_0,w_25_0,w_26_0,w_27_0,w_28_0,w_29_0,w_30_0,w_31_0,w_32_0,w_33_0,w_34_0]);
        sq_val := Evaluate(sq_val_0,[w_2,w_3,w_4,w_5,w_6,w_7,w_8,w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34]);
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
                sq_val_0 := Evaluate(SqU(j,sq_im[i]),[w_2_0,w_3_0,w_4_0,w_5_0,w_6_0,w_7_0,w_8_0,w_9_0,w_10_0,w_11_0,w_12_0,w_13_0,w_14_0,w_15_0,w_16_0,w_17_0,w_18_0,w_19_0,w_20_0,w_21_0,w_22_0,w_23_0,w_24_0,w_25_0,w_26_0,w_27_0,w_28_0,w_29_0,w_30_0,w_31_0,w_32_0,w_33_0,w_34_0]);
                sq_val := Evaluate(sq_val_0,[w_2,w_3,w_4,w_5,w_6,w_7,w_8,w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34]);
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
                        sq_val_0 := Evaluate(SqU(l,master[k]),[w_2_0,w_3_0,w_4_0,w_5_0,w_6_0,w_7_0,w_8_0,w_9_0,w_10_0,w_11_0,w_12_0,w_13_0,w_14_0,w_15_0,w_16_0,w_17_0,w_18_0,w_19_0,w_20_0,w_21_0,w_22_0,w_23_0,w_24_0,w_25_0,w_26_0,w_27_0,w_28_0,w_29_0,w_30_0,w_31_0,w_32_0,w_33_0,w_34_0]);
                        sq_val := Evaluate(sq_val_0,[w_2,w_3,w_4,w_5,w_6,w_7,w_8,w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34]);
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


b := [ ];
ind:=1;
for i in [0..max_deg] do
	len := # MonomialsOfWeightedDegree(R, i);
	for j in [1..len] do 
		 x := MonomialsOfWeightedDegree(R, i)[j];
		 q_val := Evaluate(x,[w_2_0,w_3_0,w_4_0,w_5_0,w_6_0,w_7_0,w_8_0,w_9_0,w_10_0,w_11_0,w_12_0,w_13_0,w_14_0,w_15_0,w_16_0,w_17_0,w_18_0,w_19_0,w_20_0,w_21_0,w_22_0,w_23_0,w_24_0,w_25_0,w_26_0,w_27_0,w_28_0,w_29_0,w_30_0,w_31_0,w_32_0,w_33_0,w_34_0]);
        	 r_val := Evaluate(q_val,[w_2,w_3,w_4,w_5,w_6,w_7,w_8,w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34]);  
		if r_val ne 0 then 
 		Append(~b, MonomialsOfWeightedDegree(R, i)[j]);
 		ind:=ind+1; 
		end if; 
       	end for; 
end for; 

b_len := # b;
master := [];
print("Computing list D");
for q in [2..b_len] do
percent_done := q/b_len; 
print(percent_done); 
if Evaluate(Qi(1,b[q]),[w_2_0,w_3_0,w_4_0,w_5_0,w_6_0,w_7_0,w_8_0,w_9_0,w_10_0,w_11_0,w_12_0,w_13_0,w_14_0,w_15_0,w_16_0,w_17_0,w_18_0,w_19_0,w_20_0,w_21_0,w_22_0,w_23_0,w_24_0,w_25_0,w_26_0,w_27_0,w_28_0,w_29_0,w_30_0,w_31_0,w_32_0,w_33_0,w_34_0]) eq 0 then Append(~master,b[q]); 
end if;
if Evaluate(Qi(2,b[q]),[w_2_0,w_3_0,w_4_0,w_5_0,w_6_0,w_7_0,w_8_0,w_9_0,w_10_0,w_11_0,w_12_0,w_13_0,w_14_0,w_15_0,w_16_0,w_17_0,w_18_0,w_19_0,w_20_0,w_21_0,w_22_0,w_23_0,w_24_0,w_25_0,w_26_0,w_27_0,w_28_0,w_29_0,w_30_0,w_31_0,w_32_0,w_33_0,w_34_0]) eq 0 then Append(~master,b[q]);
end if;
prop_q := propogate(b[q]);
for i in [1..# prop_q] do 
Append(~master,prop_q[i]); 
end for;
end for; 
// Add w_i's to master
for i in [2..max_deg] do
        Append(~master,w(i));
end for;
print("Finished with list D");

master_deg := []; 
for i in [1..max_deg] do 
master_deg[i] := []; 
end for; 

for i in [1..# master] do
Append(~master_deg[Degree(master[i])],master[i]);
end for;

for a in [2..max_deg] do 
b_deg := [];
ind_deg := 1;
deg := a;
b_deg := master_deg[a]; 

vspace := VectorSpace(GF(2), # MonomialsOfWeightedDegree(R,deg)); 

q := [];
m_deg := MonomialsOfWeightedDegree(R,deg);
for i in [1..# MonomialsOfWeightedDegree(R,deg)] do 
	val_q := Evaluate(m_deg[i],[w_2_0,w_3_0,w_4_0,w_5_0,w_6_0,w_7_0,w_8_0,w_9_0,w_10_0,w_11_0,w_12_0,w_13_0,w_14_0,w_15_0,w_16_0,w_17_0,w_18_0,w_19_0,w_20_0,w_21_0,w_22_0,w_23_0,w_24_0,w_25_0,w_26_0,w_27_0,w_28_0,w_29_0,w_30_0,w_31_0,w_32_0,w_33_0,w_34_0]);
	val_r := Evaluate(val_q,[w_2,w_3,w_4,w_5,w_6,w_7,w_8,w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34]);
	if val_r ne m_deg[i] then 
	Append(~b_deg,m_deg[i] + val_r);
	end if;
        //end if; 
end for;

basis_vspace := Basis(vspace);
for i in [1..# b_deg] do 
	q[i] := &+[vspace!0+basis_vspace[Position(MonomialsOfWeightedDegree(R,deg),Terms(b_deg[i])[j])] :j in [1..# Terms(b_deg[i])]];
end for; 
S := sub<vspace | q>;
C := Complement(vspace,S);
//print(C);
basis_len := # Basis(C);
if basis_len gt 0 then
for p in [1..# Basis(C)] do
r_val := &+[Basis(C)[p][i]*MonomialsOfWeightedDegree(R,deg)[i] :i in  [1..# MonomialsOfWeightedDegree(R,deg)]];
//print(r_val);
prop_r := propogate(r_val); 
for v in [1..# prop_r] do
	Append(~master_deg[Degree(prop_r[v])],prop_r[v]); 
	//master := Append(master,prop_r[v]);
end for;
end for;
end if;
q_deg := quo<vspace | q>; 
end for;



R<w_1,w_2,w_3,w_4,w_5,w_6,w_7,w_8,w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34>
  := PolynomialRing(Integers(),[1..34]);

T<w1_0,w2_0,w3_0,w4_0,w5_0,w6_0,w7_0,w8_0,w9_0,w10_0,w11_0,w12_0,w13_0,w14_0,w15_0,w16_0,w17_0,w18_0,w19_0,w20_0,w21_0,w22_0,w23_0,w24_0,w25_0,w26_0,w27_0,w28_0,w29_0,w30_0\
,w31_0,w32_0,w33_0,w34_0> := quo< R | w_1>;

w_s := [R!1, R!0, w_1,w_2, w_3, w_4, w_5, w_6, w_7, w_8,
        w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34];


function w_(i)
  if i gt 35 then return R!0;
  else return w_s[i+1];
  end if;
end function;

R_2<w_1,w_2,w_3,w_4,w_5,w_6,w_7,w_8,w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34>
  := PolynomialRing(GF(2),[1..34]);


w_s_2 := [R_2!1, R_2!0, w_1,w_2, w_3, w_4, w_5, w_6, w_7, w_8,
        w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34];




function w__2(i)
  if i gt 35 then return R_2!0;
  else return w_s_2[i+1];
  end if;
end function;


function symm_base_change(deg,r)
	b := []; 
	b_2 := []; 
	for i in [1..# Partitions(deg)] do 
		b[i] := &*[w_(Partitions(deg)[i][j]+1) :j in [1..# Partitions(deg)[i]]];
		b_2[i] := &*[w__2(Partitions(deg)[i][j]+1) :j in [1..# Partitions(deg)[i]]];

	end for; 

Z := Matrix(R,# Partitions(deg), 1, b); 
Z_2 := Matrix(R_2, # Partitions(deg), 1, b_2); 
tmat := MonomialToElementaryMatrix(deg);
vals := [];

for i in [1..# Rows(tmat)] do
for j in [1.. # Rows(tmat)] do
Append(~vals,tmat[i,j]);
end for;
end for;

tmat_R := Matrix(R,# Partitions(deg),# Partitions(deg),vals);

tmat_2 := Matrix(R_2,# Partitions(deg),# Partitions(deg),vals);
 
if r eq 1 then return(tmat_R*Z); 
else return(tmat_2*Z_2);
end if; 
end function; 


function mspinc_generators(deg)
        parts := Partitions(deg);
        parts_nondy := [];
        gens := [];
        for i in [1..# parts] do
                 if 1 in parts[i] or 3 in parts[i] or 7 in parts[i] or 15 in parts[i] or 31 in parts[i] then continue;
                else Append(~parts_nondy, i);
                end if;
                end for;
        base_polys := symm_base_change(deg,1);

	rels := [];
	for i in [1..# master] do
        if Degree(master[i]) eq deg then Append(~rels,Evaluate(master[i],[w_2,w_3,w_4,w_5,w_6,w_7,w_8,w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34]));
        end if;
	end for;

	for i in [1..# spinc_rels] do
        Append(~rels,Evaluate(spinc_rels[i],[w_2,w_3,w_4,w_5,w_6,w_7,w_8,w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34]));
	end for;

	T<w_1_0,w_2_0,w_3_0,w_4_0,w_5_0,w_6_0,w_7_0,w_8_0,w_9_0,w_10_0,w_11_0,w_12_0,w_13_0,w_14_0,w_15_0,w_16_0,w_17_0,w_18_0,w_19_0,w_20_0,w_21_0,w_22_0,w_23_0,w_24_0,w_25_0,w_26_0,w_27_0,w_28_0,w_29_0,w_30_0,w_31_0,w_32_0,w_33_0,w_34_0> := quo< R | rels,w_1>;

	
        polys := [];
        for i in [1..# parts_nondy] do
        x:=base_polys[parts_nondy[i]];
        val_t := Evaluate(x,[w1_0,w2_0,w3_0,w4_0,w5_0,w6_0,w7_0,w8_0,w9_0,w10_0,w11_0,w12_0,w13_0,w14_0,w15_0,w16_0,w17_0,w18_0,w19_0,w20_0,w21_0,w22_0,w23_0,w24_0,w25_0,w26_0,w27_0,w28_0,w29_0,w30_0,w31_0,w32_0,w33_0,w34_0]);
        val_q := Evaluate(val_t,[w_1,w_2,w_3,w_4,w_5,w_6,w_7,w_8,w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,   w_32,w_33,w_34]);
        Append(~polys,val_r);
	val_t := Evaluate(val_q,[w_1_0,w_2_0,w_3_0,w_4_0,w_5_0,w_6_0,w_7_0,w_8_0,w_9_0,w_10_0,w_11_0,w_12_0,w_13_0,w_14_0,w_15_0,w_16_0,w_17_0,w_18_0,w_19_0,w_20_0,w_21_0,w_22_0,w_23_0,w_24_0,w_25_0,w_26_0,w_27_0,w_28_0,w_29_0,w_30_0,w_31_0,w_32_0,w_33_0,w_34_0]);
        val_tt := Evaluate(val_t,[w_1,w_2,w_3,w_4,w_5,w_6,w_7,w_8,w_9,w_10,w_11,w_12,w_13,w_14,w_15,w_16,w_17,w_18,w_19,w_20,w_21,w_22,w_23,w_24,w_25,w_26,w_27,w_28,w_29,w_30,w_31,w_32,w_33,w_34]);
	if val_tt ne 0 then 
	print(parts[parts_nondy[i]]); 
	print(val_tt);
	end if;  
        end for;
return "";
end function;

for i in [2..max_deg] do 
print(i);
mspinc_generators(i);
end for; 

exit;
