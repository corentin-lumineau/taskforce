const showComment = () => {

const btnComments = document.querySelectorAll(".task-comment");
const modaleComments = document.querySelectorAll(".bg-hard-green");
const btnExits = document.querySelectorAll(".btn-2");


const hideElement = (element) => {
    element.classList.add("d-none");
}

const showElement = (element) => {
    element.classList.remove("d-none");
  }

  modaleComments.forEach((modaleComment) => {
    hideElement(modaleComment); 
})


    btnComments.forEach((btnComment) => { 
        btnComment.addEventListener("click", (event) => {
            const modaleComments = document.querySelectorAll(".bg-hard-green");
    
            modaleComments.forEach((modaleComment)=> {
                if (modaleComment.id == event.currentTarget.id)  {
                    showElement(modaleComment);
                } 
            })
        })
    })

    btnExits.forEach((btnExit) => {
        btnExit.addEventListener("click", (event) => {
            const modaleComments = document.querySelectorAll(".bg-hard-green");

            modaleComments.forEach((modaleComment)=> {
                if (modaleComment.id == event.currentTarget.id)  {
                    hideElement(modaleComment);
                } 
            })
        })  
    })
}

 export { showComment } ;