module.exports = function Mental(){
    let names = '';
    let surnames = '';

    function setNames(patientName){
        names = patientName
        return;
    }

    function getNames(){
        return names;
    }

    function setSurname (patientSurname){
        surnames = patientSurname
        return;
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
