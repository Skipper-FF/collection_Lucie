const formSteps = () => {

    const goToSteps = document.querySelectorAll('.go-to-step');
    console.log(goToSteps);
    goToSteps.forEach( (step) => {
        step.addEventListener( 'click', (event) => {
            event.preventDefault();
            const currentStep = step.parentElement.parentElement;
            currentStep.classList.remove('active');
            const nextStep = document.getElementById(event.currentTarget.dataset.target);
            nextStep.classList.add('active');
            const nextTab = document.getElementById(event.currentTarget.dataset.target+"-tab");
            nextTab.classList.add('active-tab');
            if (nextTab.nextElementSibling) {
                nextTab.nextElementSibling.classList.remove('active-tab');
            }
            // console.log(nextTab, nextTab.nextElementSibling)
        });
    });
}

export { formSteps };