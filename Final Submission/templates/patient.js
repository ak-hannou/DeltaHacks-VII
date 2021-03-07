// patient.js
//

const init = function(){
    document.getElementById('button-cancel').addEventListener('click', reset);
    document.getElementById('button-send').addEventListener('click', send);
}

const reset = function(ev){
    //HTML will automatically put the form back to its initial state
    //unless we do
    ev.preventDefault();
    // programmatically we can reset it
    document.getElementById('form-user').reset();
    //if you want to do anything else...
}

const send = function(ev){
    ev.preventDefault(); //we are overwritting the default
    ev.stopPropagation();
    //or the click will travel to the form and the form will submit
    let fails = validate();
    //IF we wanted to do some async things then use a Promise with .then and .catch
    if(fails.length === 0){
        //good to go
        document.getElementById('form-user').submit();
    }else{
        //there are some errors to display
        //bad user
        //let err = document.querySelector('.error');
        //let input = err.querySelector('input');
        //err.setAttribute('data-errormsg', ` ... Missing ${input.placeholder}`);
        fails.forEach(function(obj){
            let field = document.getElementById(obj.input);
            field.parentElement.classList.add('error');
            field.parentElement.setAttribute('data-errormsg', obj.msg);
        })
    }
}

const validate = function(ev){
    //let valid = true;
    let failures = [];
    //checkbox (or radio buttons grouped by name)
    let chk = document.getElementById('input-alive');
    // .checked .value
    if(!chk.checked){
        //valid = false;
        //chk.parentElement.classList.add('error');
        //chk.parentElement.setAttribute('data-errormsg', 'Must be alive to submit.');
        failures.push({input: 'input-alive', msg: 'Must be alive to submit.'})
    }

    //select
    let select = document.getElementById('input-age');
    // .selectedIndex  .options  .length   .selectedValue  .value
    if( select.selectedIndex === 0 ){
        failures.push({input:'input-age', msg:'Too young'})
    }

    //inputs for text, email, tel, color, number...
    let first = document.getElementById('input-first');
    let password = document.getElementById('input-password');
    let email = document.getElementById('input-email');
    //.value, .defaultValue, length of value
    if( first.value === ""){
        failures.push({input:'input-first', msg:'Required Field'})
    }
    if( password.value === "" || password.value.length < 8){
        failures.push({input:'input-password', msg:'Must be at least 8 chars'})
    }
    if( email.value === ""){
        failures.push({input:'input-email', msg:'Required Field'})
    }

    //return a boolean || an object with details about the failures
    return failures;
}


document.addEventListener('DOMContentLoaded', init);
