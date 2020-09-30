module.exports = function Mental(pool){
    let illness = [];

    function displaySymptoms(){
        pool.query("select * from symptoms");
    }

    function name(name){
        if(!name){
            return "Please enter name!";
        }
    }

    function age(age){
        if(!age){
            return "Please select your age group!";
        }
    }

    return {
        displaySymptoms,
        name,
        age
    }
}
