const postsAllBtn = document.querySelector(".all-posts-btn")
const postsLastBtn = document.querySelector(".last-posts-btn")

if (document.querySelector(".all-posts")) {
  window.addEventListener = ("load", () => {
    document.querySelector(".all-posts").style.display = "block"
    document.querySelector(".last-posts").style.display = "none"
  })
  
  postsAllBtn.addEventListener("click", () => {
    document.querySelector(".all-posts").style.display = "none"
    document.querySelector(".last-posts").style.display = "block"
  })
  
  postsLastBtn.addEventListener("click", () => {
    document.querySelector(".all-posts").style.display = "block"
    document.querySelector(".last-posts").style.display = "none"
  })
  
}

if (document.querySelector(".comment-input")) {
  const commentInput = document.querySelector(".comment-input")

  commentInput.addEventListener("click", () => {
    commentInput.setAttribute('rows', 6)
  })
}


