def caesar_cipher(string, shift)
    cipher_array = []

    string.each_codepoint do |code|
        shifted_char = process_code(code, shift).chr
        cipher_array.push(shifted_char)
    end
    cipher_array.join()
end

def process_code(code, shift)
    form = get_case_by_code(code)
    unless form == "n/a"
        code += shift
        code = force_valid_shift(code, form)
    end
    return code
end

def force_valid_shift(code, form)
    case form
    when 'lower'
        offset = get_code('a')
    when 'upper'
        offset = get_code('A')
    end

    (code - offset) % 26 + offset
end

def get_case_by_code(code)
    if is_lower_by_code(code)
        return 'lower'
    elsif is_upper_by_code(code)
        return 'upper'
    else
        return 'n/a'
    end
end

def is_lower_by_code(code)
    get_code('a') <= code && code <= get_code('z')
end

def is_upper_by_code(code)
    get_code('A') <= code && code <= get_code('Z')
end

def get_code(char)
    char.each_codepoint.first
end
