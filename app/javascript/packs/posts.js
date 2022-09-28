const postsAllBtn = document.querySelector(".all-posts-btn")
const postsLastBtn = document.querySelector(".last-posts-btn")

window.addEventListener = ("load", () => {
  document.querySelector(".all-posts").style.display = "none"
  document.querySelector(".last-posts").style.display = "block"
})

postsAllBtn.addEventListener("click", () => {
  document.querySelector(".all-posts").style.display = "block"
  document.querySelector(".last-posts").style.display = "none"
})

postsLastBtn.addEventListener("click", () => {
  document.querySelector(".all-posts").style.display = "none"
  document.querySelector(".last-posts").style.display = "block"
})