//
//  CVModel.swift
//  MobileCV
//
//  Created by Manish Parihar on 11.07.23.
//

import Foundation

struct Item : Codable {
    let data : [ItemData]
    
    enum CodingKeys: String, CodingKey {
            case data = "items"
    }
}



struct ItemData: Codable, Hashable {
    let id: Int
    let displayName: String
    let firstName:String
    let lastName: String
    let dateOfBirth : String
    let place: String
    let country: String
    let phoneNumber: String
    let email: String
    let photo: String
    let designation: String
    let tagline: String
    let educationBackground: [EducationBackground]?
    let workExperience: [WorkExperience]
    let programmingSkil: [ProgrammingSkill]?
    let projectSkill: [ProjectSkill]?
    let frameworks: [Frameworks]?
    let tools: [Tools]?
    let interest: [Interests]
    let socialNetwork: [SocialNetwork]?
    let spokenLanguage: [SpokenLanguage]?
    let achievement: [Achievements]?
    
    static func == (lhs: ItemData, rhs: ItemData) -> Bool {
        return
            lhs.firstName == rhs.firstName
    }
    
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(firstName)
    }
}

struct EducationBackground: Codable {
    let degreeID: String,
    degreeUniversityName: String,
    degreeUniversityPlace: String,
    degreeUniversityCountry: String,
    degreeName: String,
    degreeCourse: String,
    degreeStartYear: String,
    degreeEndYear: String
    
}

struct WorkExperience: Codable {
    let workID: String,
     workCompany: String,
     workPlace: String,
     workCountry: String,
     workDesignation: String,
     workCompanyLogo: String,
     workStartDate: String,
     workEndDate: String,
     workDescription : [WorkDescription]
    
    enum CodingKeys: String, CodingKey {
            case workID = "workID"
            case workCompany = "workCompany"
            case workPlace = "workPlace"
            case workCountry = "workCountry"
            case workDesignation = "workDesignation"
            case workCompanyLogo = "workCompanyLogo"
            case workStartDate = "workStartDate"
            case workEndDate = "workEndDate"
            case workDescription = "workDescription"
        }
    
    // Implementing the Hashable protocol
       func hash(into hasher: inout Hasher) {
           // Use the properties that uniquely identify a WorkExperience instance to generate the hash value
           hasher.combine(workCompany)
           hasher.combine(workPlace)
           // Combine other properties if necessary
       }
       
       static func == (lhs: WorkExperience, rhs: WorkExperience) -> Bool {
           // Implement the equality check for WorkExperience instances based on their properties
           return lhs.workCompany == rhs.workCompany && lhs.workPlace == rhs.workPlace
           // Compare other properties if necessary
       }
   
}

struct WorkDescription : Codable {
    let workDescID: String
    let workDescStmt: [String]
    
    enum CodingKeys: String, CodingKey {
            case workDescID = "workDescId"
            case workDescStmt
        }
}

struct ProgrammingSkill : Codable {
    let skillID : String,
    skillValue : String,
    skillPoints : String
    
    enum CodingKeys: String, CodingKey {
            case skillID = "skillId"
            case skillValue, skillPoints
        }
}

struct ProjectSkill : Codable {
    let projectID : String,
    projectValue : String
    
    enum CodingKeys: String, CodingKey {
            case projectID = "projectId"
            case projectValue
        }
}

struct Frameworks : Codable {
    let frameworkID : String,
        frameworkSubject : String,
        frameworkValue : String
}

enum FrameworkSubject: String, Codable {
    case mlAI = "ml-ai"
    case mobile = "mobile"
    case webDevelopment = "web-development"
}

struct Tools : Codable {
    let toolsID : String,
        toolsName : String
}

struct Interests : Codable {
    let interestsID : String,
        interestsName : String
}

struct SocialNetwork : Codable {
    let socialID : String,
        socialName : String,
        socialValue : String
}

struct SpokenLanguage : Codable {
    let slID : String,
        slValue : String
}

struct Achievements : Codable {
    let achievementsID : String,
        achievementsName : String,
        achievementsDesc : String,
        achievementsYear : String
}

