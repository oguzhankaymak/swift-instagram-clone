//
//  Data.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 5.01.2023.
//

import Foundation

var storiesData: [Story] = [
    Story(username: "oguzhankaymakk", imagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg"),
    Story(username: "oguzhankaymakk", imagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg"),
    Story(username: "oguzhankaymakk", imagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg"),
    Story(username: "oguzhankaymakk", imagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg"),
    Story(username: "oguzhankaymakk", imagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg"),
    Story(username: "oguzhankaymakk", imagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg")
]

var postsData: [Post] = [
    Post(
        username: "oguzhankaymakk",
        profileImagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg",
        imagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg",
        likeCount: 50,
        commentCount: 80,
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        dateDesc: "30 min ago"
    ),
    Post(
        username: "oguzhankaymakk",
        profileImagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg",
        imagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg",
        likeCount: 70,
        commentCount: 20,
        description: """
            Lorem Ipsum is simply dummy text of the printing and typesetting industry.
            Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
            when an unknown printer took a galley of type and scrambled it to make a type specimen book.
            """,
        dateDesc: "1 hour ago"
    ),
    Post(
        username: "oguzhankaymakk",
        profileImagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg",
        imagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg",
        likeCount: 126,
        commentCount: 20,
        description: """
            Lorem Ipsum is simply dummy text of the printing and typesetting industry.
            Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
            when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum
            is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's
            standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it
            to make a type specimen book.
            """,
        dateDesc: "2 hour ago"
    ),
    Post(
        username: "oguzhankaymakk",
        profileImagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg",
        imagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg",
        likeCount: 126,
        commentCount: 20,
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        dateDesc: "2 hour ago"
    )
]
