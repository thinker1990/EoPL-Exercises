; For val = (bool-val #f), (num-val (expval->num val)) != val because
; expval->num is undefined for expressed boolean values.
