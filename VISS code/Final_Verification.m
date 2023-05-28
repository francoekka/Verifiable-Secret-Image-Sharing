Img = imread("OUTPUT.png");
%Final_ID = [1 9 6];
Final_ID = ["fdffefbd6cf54c180cb41cf0aff9aff7bfffb9df2864010000000000002042a01",
            "fffffc3dc41184310c3019f0affdbfffffffbbd71be400000000008000804eba9",
            "ffff9e2545355c3500b08cf8bff9ffffffffbbd71ae411000000028000004af06"];
k = 3;

for i=1:k
    fid = fopen('verfile.txt');
    while ~feof(fid)
        tline = fgetl(fid);
        newStr = extractBefore(tline,',');
        %fprintf(newStr)
        cmp1 = strcmp(newStr,Final_ID(i));
        if (cmp1 == 1)
            %fprintf("matched");
            nstr = extractAfter(tline,',');
            hash_val = imgver(Img,Final_ID(i));
            cmp2 = strcmp(nstr,hash_val);
            if ( cmp2 == 0)
                fprintf("Cheating Detected");
                return
            end
        end   
    end
    fclose(fid);
 end
 fprintf("Accurate Secret \n");

