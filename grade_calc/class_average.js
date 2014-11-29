function calculate_class_average() {
    var keys = weight_dict.keys()
    var used_weight = 0;
    for (var i=0; i < keys.length; i++) {
        if (grade_dict[i] != 'null') {
            used_weight = used_weight + weight[i];
        };
    };
    var class_average = 0;
    for (var i=0; i < keys.length; i++) {
        if (grade_dict[i] != 'null') {
            partial = (weight_dict[i] / used_weight) * avg_dict[i];
            class_average = class_average + partial;
        };
    };
    document.getElementById('average').innerHTML = class_average;
    return class_average;
};