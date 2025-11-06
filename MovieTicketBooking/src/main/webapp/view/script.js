const   body = document.querySelector("body"),
        nav = document.querySelector("nav"),
        modeToggle=document.querySelector(".dark-Light"),
        
        searchToggle=document.querySelector(".searchToggle"),
        sideBarClose=document.querySelector(".sideBarClose")
    sideBarOpen=document.querySelector(".sideBarOpen");

    let getMode = localStorage.getItem("mode");
        if(getMode && getMode === "dark-mode"){
            body.classList.add("dark");
        }
    
        //js code toggle dark and light mode
        modeToggle.addEventListener("click", () =>{
            modeToggle.classList.toggle("active");
            body.classList.toggle("dark");

            if(body.classList.contains("dark")){
                localStorage.setItem("mode","light-mode")
            }else{
                localStorage.setItem("mode","dark-mode")

            }
        });
        //js code toggle search box
        searchToggle.addEventListener("click", () =>{
            searchToggle.classList.toggle("active");
           
        });
        //js code to toggle side bar
        sideBarOpen.addEventListener("click",()=>{
            nav.classList.add("active");
        });
        body.addEventListener("click",e =>{
           let clickedElm = e.target;
           if(!clickedElm.classList.contains("sideBarOpen") && !clickedElm.classList.contains("menu")) {
             nav.classList.remove("active");
           }
           
        });