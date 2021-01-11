const showEditTask = () => {
    const editContainer = document.getElementById("add-task");
    console.log(editContainer);
    if (editContainer) {
        const modale = document.querySelector(".bg-green");
        const btnEditTask = document.getElementById("edit-task");
        console.log(btnEditTask);
        console.log(modale);
        const hideElement = (element) => {
            element.classList.add("d-none");
        }

        const showElement = (element) => {
            element.classList.remove("d-none");
          }

        hideElement(modale);

        btnEditTask.addEventListener("click", (event) => {
            showElement(modale);
        })
    }
};

export { showEditTask };