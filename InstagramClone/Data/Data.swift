//
//  Data.swift
//  InstagramClone
//
//  Created by Oğuzhan Kaymak on 5.01.2023.
//

// swiftlint:disable all

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
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        dateDesc: "1 hour ago"
    ),
    Post(
        username: "oguzhankaymakk",
        profileImagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg",
        imagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg",
        likeCount: 126,
        commentCount: 20,
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
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

var discoversData: [Discover] = [
    Discover(
        contentPath: "https://user-images.githubusercontent.com/36153454/211616276-fb015f3d-b480-4150-98b8-bd02e8cbb7e6.JPG",
        contentType: .image
    ),
    Discover(
        contentPath: "https://user-images.githubusercontent.com/36153454/211622448-40035878-4105-4f7e-b299-3a6cf8997212.mov",
        contentType: .video
    ),
    Discover(
        contentPath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg",
        contentType: .image
    ),
    Discover(
        contentPath: "https://user-images.githubusercontent.com/36153454/211616308-f53cd63f-16ff-44d9-ab12-a8959d10e74f.JPG",
        contentType: .image
    ),
    Discover(
        contentPath: "https://user-images.githubusercontent.com/36153454/211616308-f53cd63f-16ff-44d9-ab12-a8959d10e74f.JPG",
        contentType: .image
    ),
    Discover(
        contentPath: "https://user-images.githubusercontent.com/36153454/211622448-40035878-4105-4f7e-b299-3a6cf8997212.mov",
        contentType: .video
    )
]

var usersData: [User] = [
    User(
        username: "oguzhankaymakk",
        nameSurname: "Oğuzhan Kaymak",
        profileImagePath: "https://www.oguzhankaymak.net/oguzhankaymak.jpg"
    ),
    User(
        username: "framesbyc",
        nameSurname: "Cihan Karaçayır",
        profileImagePath: "https://user-images.githubusercontent.com/36153454/211784386-be3e67a8-ad5b-4458-897a-c620446aaa6e.jpeg"
    ),
]

var reelsData: [Reel] = [
    Reel(
        username: "oguzhankaymakk",
        profileImageUrl: "https://www.oguzhankaymak.net/oguzhankaymak.jpg",
        videoPath: "https://user-images.githubusercontent.com/36153454/213465335-8b5be25d-bc01-4ab8-8832-4fd10731d0ec.MOV",
        description: "My awesome video",
        likeCount: "12K",
        commentCount: "1k"
    ),
    Reel(
        username: "framesbyc",
        profileImageUrl: "https://user-images.githubusercontent.com/36153454/211784386-be3e67a8-ad5b-4458-897a-c620446aaa6e.jpeg",
        videoPath: "https://user-images.githubusercontent.com/36153454/211622448-40035878-4105-4f7e-b299-3a6cf8997212.mov",
        description: "Fireee 🔥",
        likeCount: "10K",
        commentCount: "63"
    ),
    Reel(
        username: "oguzhankaymakk",
        profileImageUrl: "https://www.oguzhankaymak.net/oguzhankaymak.jpg",
        videoPath: "https://user-images.githubusercontent.com/36153454/212050262-374e8471-1718-45fa-8601-5a1b70313392.mov",
        description: "I walk everyday",
        likeCount: "1239",
        commentCount: "21"
    ),
]
