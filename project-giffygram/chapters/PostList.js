import { getPosts } from "../store/index.js"

export const PostList = () => {
    const allPosts = getPosts()
    let postList = ""

    for (const postObject of allPosts) {
        const htmlRepresentationOfThisPost = `
            <section class="post">
                <header>
                    <h2 class="post__title">${postObject.title}</h2>
                </header>
                <img class="post__image" src="${postObject.imageURL}" />
            </section>
        `

        postList += htmlRepresentationOfThisPost
    }

    return postList
}