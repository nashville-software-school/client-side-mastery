#!/bin/bash
set -u

mkdir -p $HOME/workspace/giffygram/src/styles
cd $HOME/workspace/giffygram/src/styles

echo '@import "navigation.css";
@import "footer.css";
@import "feed.css";
@import "post.css";
@import url("https://fonts.googleapis.com/css?family=Comfortaa|Patua+One");
/*Typography
--------------------------------------------------------------*/

body, button, input, select, textarea {
    color: #404040;
    font-family: "Comfortaa", Arial, sans-serif;
    font-size: 1rem;
    line-height: 1.5;
    padding: 0;
    margin: 0;
}

h1, h2, h3, h4, h5, h6 {
    font-family: "Patua One", serif;
    letter-spacing: 2px;
}

.actionIcon {
    height: 1.2em;
    margin: 0.5em 0.5em;
    cursor: pointer;
}

.highlight {
    border-color: purple;
}

.fakeLink {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
    background: none!important;
    border: none;
    cursor: pointer;
}

.fakeLink:hover {
    font-weight: bold;
}

.loginForm {
    margin: 0 25%;
}
' > main.css

echo '.giffygram__feed {
    padding: 7rem 0;
    display: flex;
    flex-direction: column;
    justify-content: center;
}
' > feed.css

echo '.footer {
    display: flex;
    flex-wrap: nowrap;
    justify-content: start;
    border-bottom: 1px solid lightblue;
    padding: 0.5em 0 0.5em 1em;
    margin-bottom: 2em;
    position: fixed;
    z-index: 11;
    bottom: 0;
    width: 100%;
    background-color: whitesmoke;
    margin: auto;
}

.footer__item {
    margin: 0 1rem;
}
' > footer.css

echo '.miniMode {
    padding: 1rem;
    margin: 0 25%;
    border: 1px dashed slategrey;
    border-radius: 0.5rem;
    text-align: center;
    cursor: pointer;
}

.newPost {
    margin: 0 25%;
}

.newPost__input {
    width: 30rem;
    margin: 0.5rem 0;
}

.newPost__description {
    width: 100%;
    height: 5em;
}

.newPost__drop {
    padding: 1rem;
    color: gray;
    font-size: 1rem;
    border: 1px dotted lightgrey;
    text-align: center;
}

.newPost__upload {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    padding: 0.75rem 0 0 0;
}

.newPost__fileUpload {
    flex-basis: 30%;
}

.newPost__uploadPrompt {
    flex-basis: 50%;
}

.newPost__plus {
    font-size: 6rem;
}

.post {
    margin: 0 25%;
    flex-basis: 50%;
}

.post__image {
    width: 100%;
}

.post__actions {
    display: flex;
    flex-direction: row;
    justify-content: center;
}

.post__tagline {
    font-size: 1.0em;
    margin: 1em 0 0.5em 0;
}

.post__remark {
    font-size: 2em;
    margin: 1em 0 0.5em 0;
}
' > post.css

echo '.navigation {
    display: flex;
    flex-wrap: nowrap;
    justify-content: start;
    border-bottom: 1px solid lightblue;
    padding: 0.5em 0 0.5em 1em;
    margin-bottom: 2em;
    position: fixed;
    z-index: 11;
    top: 0;
    width: 100%;
    background-color: whitesmoke;
    margin: auto;
}

.navigation__search {
    margin-left: 3rem;
}

.navigation__item {
    vertical-align: baseline;
}

.navigation__name {
    font-size: 1.5rem;
    padding-left: 0.5rem;
    padding-top: 0.1rem;
}

.navigation__icon > img {
    height: 2rem;
}


.navigation__message {
    margin-left: auto;
    margin-right: 4em;
    display: flex;
    flex-direction: row;
    position: relative;
}

.navigation__message > img {
    height: 2rem;
}

.notification__count{
    background-color:goldenrod;
    font-size: small;
    position: absolute;
    padding:2px;
    top: 5px;
    left: 3rem;
    min-width: 1.25rem;
    text-align: center;
    border-radius: 25px;
}

.navigation__messageItem {
    flex: 1;
}

.navigation__logout {
    margin-right: 2em;
}

#directMessageIcon {
    cursor: pointer;
}
' > navigation.css