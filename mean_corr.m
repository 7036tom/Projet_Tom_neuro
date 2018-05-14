
image=zeros(113,135,112);

for i = 1:113
    for j = 1:135
        for k = 1:112
            n = 0;
            n1 = 0;
            n2 = 0;
            n3 = 0;
            n4 = 0;
            n5 = 0;
            n6 = 0;
            n7 = 0;
            n8 = 0;
            n9 = 0;
            n10 =0;
            n11 = 0;
            
            if (image1(i,j,k) ~= 0)
                n1 = 1;
            end
            
            if (image2(i,j,k) ~= 0)
                n2 = 1;
            end
            
            if (image3(i,j,k) ~= 0)
                n3 = 1;
            end
            
            if (image4(i,j,k) ~= 0)
                n4 = 1;
            end
            
            if (image5(i,j,k) ~= 0)
                n5 = 1;
            end
            
            if (image6(i,j,k) ~= 0)
                n6 = 1;
            end
            
            if (image7(i,j,k) ~= 0)
                n7 = 1;
            end
            
            if (image8(i,j,k) ~= 0)
                n8 = 1;
            end
            
            if (image9(i,j,k) ~= 0)
                n9 = 1;
            end
            
            if (image10(i,j,k) ~= 0)
                n10 = 1;
            end
            
            if (image11(i,j,k) ~= 0)
                n11 = 1;
            end
            
            n = n1 + n2 + n3 + n4 + n5 + n6 + n7 + n8 +n9 + n10 + n11;
            
            if (n > 7)
               image(i,j,k) = ( image1(i,j,k) +image2(i,j,k)+image3(i,j,k)+image4(i,j,k)+image5(i,j,k)+image6(i,j,k)+image7(i,j,k)+image8(i,j,k)+image9(i,j,k)+image10(i,j,k)+image11(i,j,k))/n;
            end
        end
    end
end
            
            