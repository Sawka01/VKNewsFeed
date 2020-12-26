//
//  NewsfeedPresenter.swift
//  VKNewsFeed
//
//  Created by Macbook on 20.12.2020.
//  Copyright (c) 2020 Sawka uz. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
    func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
    weak var viewController: NewsfeedDisplayLogic?
    var cellLayoutCalculator: FeedCellLayoutCalculatorProtocol = FeedCellLayoutCalculator()

    let dateFormatter: DateFormatter = {
        let dt = DateFormatter()
        dt.locale = Locale(identifier: "ru_RU")
        dt.dateFormat = "d MMM 'в' HH.mm"
        return dt
    }()

    func presentData(response: Newsfeed.Model.Response.ResponseType) {

        switch response {
        case .presentNewsfeed(let feed, let revealedPostIds):
            let cells = feed.items.map { (feedItem) in
                cellViewModel(from: feedItem, profiles: feed.profiles, groups: feed.groups, revealedPostIds: revealedPostIds)
            }
            let feedViewModel = FeedViewModel.init(cells: cells)
            viewController?.displayData(viewModel: Newsfeed.Model.ViewModel.ViewModelData.displayNewsfeed(feedViewModel: feedViewModel))
        case .presentUserInfo(let user):
            let userViewModel = UserViewModel.init(photoUrlString: user?.photo100)
            viewController?.displayData(viewModel: Newsfeed.Model.ViewModel.ViewModelData.displayUser(userViewMode: userViewModel))
        }
    }

    private func cellViewModel(from feedItem: FeedItem, profiles: [Profile], groups: [Group], revealedPostIds: [Int]) -> FeedViewModel.Cell {

        let profile = self.profile(for: feedItem.sourceId, profiles: profiles, groups: groups)

//        let photoAttachment = self.photoAttachment(feedItem: feedItem)
        let photoAttachments = self.photoAttachments(feedItem: feedItem)

        let date = Date(timeIntervalSince1970: feedItem.date)
        let dateTitle = dateFormatter.string(from: date)

        let isFullSized = revealedPostIds.contains { (postId) -> Bool in
            return postId == feedItem.postId
        }

//        let isFullSized = revealedPostIds.contains(feedItem.postId)

        let sizes = cellLayoutCalculator.sizes(postText: feedItem.text, photoAttachments: photoAttachments, isFullSizedPost: isFullSized)

        return FeedViewModel.Cell.init(postId: feedItem.postId,
                                       iconUrlString: profile.photo,
                                       name: profile.name,
                                       date: dateTitle,
                                       text: feedItem.text,
                                       likes: String(feedItem.likes?.count ?? 0),
                                       comments: String(feedItem.comments?.count ?? 0),
                                       shares: String(feedItem.reposts?.count ?? 0),
                                       views: String(feedItem.views?.count ?? 0),
                                       photoAttachments: photoAttachments,
                                       sizes: sizes)
    }

    private func profile(for sourceId: Int, profiles: [Profile], groups: [Group]) -> ProfileRepresentable {

        let profilesOrGroups: [ProfileRepresentable] = sourceId >= 0 ? profiles : groups
        let normalSourceId = sourceId >= 0 ? sourceId : -sourceId
        let profileRepresentable = profilesOrGroups.first { (myProfileRepresentable) -> Bool in
            myProfileRepresentable.id == normalSourceId
        }
        return profileRepresentable!
    }

    private func photoAttachment(feedItem: FeedItem) -> FeedViewModel.FeedCellPhotoAttachment? {
        guard let photos = feedItem.attachments?.compactMap({ (attachment) in
            attachment.photo
        }), let firstPhoto = photos.first else {
            return nil
        }
        return FeedViewModel.FeedCellPhotoAttachment.init(photoUrlString: firstPhoto.srcBIG,
                                                          width: firstPhoto.width,
                                                          height: firstPhoto.height)
    }

    private func photoAttachments(feedItem: FeedItem) -> [FeedViewModel.FeedCellPhotoAttachment] {
        guard let attachments = feedItem.attachments else { return [] }

        return attachments.compactMap { (attachment) -> FeedViewModel.FeedCellPhotoAttachment? in
            guard let photo = attachment.photo else { return nil }
            return FeedViewModel.FeedCellPhotoAttachment.init(photoUrlString: photo.srcBIG,
                                                              width: photo.width,
                                                              height: photo.height)
        }
    }
}
