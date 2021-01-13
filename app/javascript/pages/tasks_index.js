const showEditTask = () => {
    const editContainer = document.getElementById("add-task");
    
    if (editContainer) {
        const modale = document.querySelector(".bg-green");
        const btnEditTask = document.getElementById("edit-task");
        const btnExitEditTask = document.getElementById("exit-edit");
    
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

        btnExitEditTask.addEventListener("click", (event) => {
            hideElement(modale);
        })
    }
}

const showTask = () => {
    const indexContainer = document.getElementById("tasks");

    if (indexContainer) {

        const modaleTasks = document.querySelectorAll(".bg-white");
        const btnTasks = document.querySelectorAll(".details");
        const btnExits = document.querySelectorAll(".btn-1");

        const hideElement = (element) => {
            element.classList.add("d-none");
        }

        const showElement = (element) => {
            element.classList.remove("d-none");
            }

        modaleTasks.forEach((modaleTask) => {
            hideElement(modaleTask); 
        })

        btnTasks.forEach((btnTask) => { 
            btnTask.addEventListener("click", (event) => {
                
                const modaleTasks = document.querySelectorAll(".bg-white");

                modaleTasks.forEach((modaleTask)=> {
                    if (modaleTask.id == event.currentTarget.id)  {
                        showElement(modaleTask);
                    } 
                })
            })
        })    

        btnExits.forEach((btnExit) => {
            btnExit.addEventListener("click", (event) => {
                console.log(event.currentTarget.id);
                const modaleTasks = document.querySelectorAll(".bg-white");
    
                modaleTasks.forEach((modaleTask)=> {
                    if (modaleTask.id == event.currentTarget.id)  {
                        hideElement(modaleTask);
                    } 
                })
            })  
        })
      
    }
}


export { showEditTask };
export { showTask };