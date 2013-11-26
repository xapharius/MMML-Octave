function data = randomOneDimensionalData(_fileName, _size = 100)
    data = zeros(_size, 6);
    for i = 1 : _size
        data(i, 1) = rand(1);
        data(i, 2) = rand(1);
        if (data(i,1) < 0.5 && data(i,2) < 0.5)
            data(i,3) = 1;
        end
        if (data(i,1) > 0.5 && data(i,2) < 0.5)
            data(i,4) = 1;
        end
        if (data(i,1) < 0.5 && data(i,2) > 0.5)
            data(i,5) = 1;
        end
        if (data(i,1) > 0.5 && data(i,2) > 0.5)
            data(i,6) = 1;
        end
    end
    dlmwrite(_fileName, data);
end