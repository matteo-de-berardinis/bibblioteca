function validation(){

const form = document.querySelector("form");

form.addEventListener('submit', e =>{

    if(!form.checkValidity()){
        e.preventDefaut();
    }

    form.classList("was-validated");
})

}