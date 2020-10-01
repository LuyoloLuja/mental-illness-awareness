module.exports = function Mental(){
    let names = {};
    let surnames = {};

    function setNames(patientName){
        if(names[patientName] === undefined){
            names[patientName] = 0;
        }
    }

    function getNames(){
        return names;
    }

    function setSurname (patientSurname){
        if(surnames[patientSurname] === undefined){
            surnames[patientSurname] = 0;
        }
    }

    function getSurname(){
        return surnames;
    }

    function userInput(name, surname){
        if(name && surname){
            if(name === true && surname){
                return "Your appointment is successful" + name + surname;
            }
        }
    }

    return {
        setNames,
        getNames,
        userInput,
        setSurname,
        getSurname
    }
}
