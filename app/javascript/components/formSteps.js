const formSteps = () => {

    const goToSteps = document.querySelectorAll('.go-to-step');
    console.log(goToSteps);
    goToSteps.forEach( (step) => {
        step.addEventListener( 'click', (event) => {
            const clickOnStep = document.getElementById(event.currentTarget.dataset.target);
            console.log(clickOnStep.parentElement);
        });
    });
}

export { formSteps };