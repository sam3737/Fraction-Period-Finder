function int = listToInt(list)
    str = arrayfun(@num2str, list, 'UniformOutput', false);
    concatenated_str = strcat(str{:});
    int = str2num(concatenated_str);
end