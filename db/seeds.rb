########################
###     Settings     ###
########################
Setting.create!(
  author: 'The Christian Chain, Inc.',
  ministry_name: 'Parent Site',
  site_name: 'Parent Site',
  keywords: 'Parent Test Site, Login, Christian Chain',
  description: 'This is the login site for The Christian Chain, Inc.',
  motto: 'It is out goal to help you create a universal login for our entire network of sites.',
  launch_date: Time.now(),
  primary_color: '#006687',
  secondary_color: '#872100',
  logo: 'http://www.thechristianchain.org/assets/tcc_logo-4684734633f6bcf7e11194138c561e2ff86eeadb71815a59a6bb6f69b0a78532.png',
  favicon: '',
  apple_touch: '',
  apple_touch_152: '',
  apple_touch_167: '',
  apple_touch_180: '',
  apple_touch_startup: '',
  website: 'http://localhost:3000',
  email: 'registration@thechristianchain.org',
  phone: '(480) 818-6489',
  address1: '3317 E Bell Road',
  address2: '#101-500',
  city: 'Phoenix',
  state: 'AZ',
  zip_code: '85032',
  facebook: 'TheChristianChain',
  twitter: 'TCCFOfficial',
  instagram: 'thechristianchain',
  pinterest: 'TheChristianChain',
  linkedin: 'christianchain'
)

puts 'Settings Created'

#######################
###     Members     ###
#######################

Member.create!(
  email: 'admin@t.com',
  password: 'topsecret',
  password_confirmation: 'topsecret',
  last_sign_in_at: Time.now
)

Member.create!(
  email: 'member1@t.com',
  password: 'password',
  password_confirmation: 'password',
  last_sign_in_at: Time.now
)

Member.create!(
  email: 'member2@t.com',
  password: 'password',
  password_confirmation: 'password',
  last_sign_in_at: Time.now
)

Member.create!(
  email: 'member3@t.com',
  password: 'password',
  password_confirmation: 'password',
  last_sign_in_at: Time.now
)

Member.create!(
  email: 'member4@t.com',
  password: 'password',
  password_confirmation: 'password',
  last_sign_in_at: Time.now
)

Member.create!(
  email: 'member5@t.com',
  password: 'password',
  password_confirmation: 'password',
  last_sign_in_at: Time.now
)

puts '6 Members created'

########################
###     Profiles     ###
########################

Profile.create!(
  member_id: '1',
  provider: 'tcc',
  universal_id: '1',
  first_name: 'Super',
  last_name: 'Admin',
  user_name: 'SuperAdmin',
  gender: 'Male',
  birthday: '1982-03-28',
  phone: '602-555-1234',
  address1: '123 Main Street',
  address2: 'Apt 123',
  city: 'Phoenix',
  state: 'AZ',
  zip_code: '85022',
  tcc_profile: '',
  facebook: '',
  twitter: '',
  instagram: '',
  pinterest: '',
  linkedin: '',
  motto: 'Life is Good, God is Better',
  reg_step: '5',
  security: '3',
  user_name_created: true, 
  published: true,
  deactivated: false,
  created_at: Time.now,
  updated_at: Time.now
)

Profile.create!(
  member_id: '2',
  provider: 'tcc',
  universal_id: '2',
  first_name: 'Basic',
  last_name: 'Member',
  user_name: 'Member1',
  gender: 'Male',
  birthday: '1982-12-21',
  phone: '602-555-5678',
  address1: '123 Main Street',
  address2: 'Apt 123',
  city: 'Phoenix',
  state: 'AZ',
  zip_code: '85022',
  tcc_profile: '',
  facebook: '',
  twitter: '',
  instagram: '',
  pinterest: '',
  linkedin: '',
  motto: 'Life is Good, God is Better',
  reg_step: '1',
  security: '1',
  user_name_created: false, 
  published: false,
  deactivated: false,
  created_at: Time.now,
  updated_at: Time.now
)

Profile.create!(
  member_id: '3',
  provider: 'tcc',
  universal_id: '3',
  first_name: 'Basic',
  last_name: 'Member',
  user_name: 'Member2',
  gender: 'Male',
  birthday: '1982-12-21',
  phone: '602-555-5678',
  address1: '123 Main Street',
  address2: 'Apt 123',
  city: 'Phoenix',
  state: 'AZ',
  zip_code: '85022',
  tcc_profile: '',
  facebook: '',
  twitter: '',
  instagram: '',
  pinterest: '',
  linkedin: '',
  motto: 'Life is Good, God is Better',
  reg_step: '1',
  security: '1',
  user_name_created: false, 
  published: false,
  deactivated: false,
  created_at: Time.now,
  updated_at: Time.now
)

Profile.create!(
  member_id: '4',
  provider: 'tcc',
  universal_id: '4',
  first_name: 'Basic',
  last_name: 'Member',
  user_name: 'Member3',
  gender: 'Male',
  birthday: '1982-12-21',
  phone: '602-555-5678',
  address1: '123 Main Street',
  address2: 'Apt 123',
  city: 'Phoenix',
  state: 'AZ',
  zip_code: '85022',
  tcc_profile: '',
  facebook: '',
  twitter: '',
  instagram: '',
  pinterest: '',
  linkedin: '',
  motto: 'Life is Good, God is Better',
  reg_step: '1',
  security: '1',
  user_name_created: false, 
  published: false,
  deactivated: false,
  created_at: Time.now,
  updated_at: Time.now
)

Profile.create!(
  member_id: '5',
  provider: 'tcc',
  universal_id: '5',
  first_name: 'Basic',
  last_name: 'Member',
  user_name: 'Member4',
  gender: 'Male',
  birthday: '1982-12-21',
  phone: '602-555-5678',
  address1: '123 Main Street',
  address2: 'Apt 123',
  city: 'Phoenix',
  state: 'AZ',
  zip_code: '85022',
  tcc_profile: '',
  facebook: '',
  twitter: '',
  instagram: '',
  pinterest: '',
  linkedin: '',
  motto: 'Life is Good, God is Better',
  reg_step: '1',
  security: '1',
  user_name_created: false, 
  published: false,
  deactivated: false,
  created_at: Time.now,
  updated_at: Time.now
)

Profile.create!(
  member_id: '6',
  provider: 'tcc',
  universal_id: '6',
  first_name: 'Basic',
  last_name: 'Member',
  user_name: 'Member5',
  gender: 'Male',
  birthday: '1982-12-21',
  phone: '602-555-5678',
  address1: '123 Main Street',
  address2: 'Apt 123',
  city: 'Phoenix',
  state: 'AZ',
  zip_code: '85022',
  tcc_profile: '',
  facebook: '',
  twitter: '',
  instagram: '',
  pinterest: '',
  linkedin: '',
  motto: 'Life is Good, God is Better',
  reg_step: '1',
  security: '1',
  user_name_created: false, 
  published: false,
  deactivated: false,
  created_at: Time.now,
  updated_at: Time.now
)

puts '6 Profiles created'
########################
###       Blog       ###
########################
Blog.create!(
  name:                 'Client Site Blog',
  description:          'This is the blog for the test Client Site.',
  has_sections:         false,
  has_subscription:     false,
  visible:              true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

puts 'Blog Created'

########################
###     Sections     ###
########################
Section.create!(
  name:                 'Main',
  slug:                 'main', 
  description:          'Where all of the main content is held.',
  primary:              true,
  active:               true,
  order:                1, 
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Section.create!(
  name:                 'Subscription',
  slug:                 'subscription',
  description:          'Where all of the subscription content is held.',
  primary:              false,
  active:               false,
  order:                2, 
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Section.create!(
  name:                 'Archived',
  slug:                 'archived',
  description:          'Where all of the archived content is held.',
  primary:              false,
  active:               true,
  order:                3, 
  created_at:           Time.now(),
  updated_at:           Time.now()
)

puts '3 Sections Created'

########################
### Section-Blog Map ###
########################
SectionBlogMap.create!(
  section_id:           1,
  blog_id:              1,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

SectionBlogMap.create!(
  section_id:           2,
  blog_id:              1,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

SectionBlogMap.create!(
  section_id:           3,
  blog_id:              1,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

puts '3 Section-Blog Maps Created'

########################
###    Categories    ###
########################
Category.create!(
  name:                 'Main',
  slug:                 'main',
  description:          'The main category',
  primary:              true,
  active:               true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Category.create!(
  name:                 'About Us',
  slug:                 'about-us',
  description:          'About the Ministry',
  primary:              false,
  active:               true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Category.create!(
  name:                 'Theology',
  slug:                 'theology',
  description:          'A theology category',
  primary:              false,
  active:               true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Category.create!(
  name:                 'Non-active',
  slug:                 'non-active',
  description:          'A non-active category',
  primary:              false,
  active:               false,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Category.create!(
  name:                 'Bible',
  slug:                 'bible',
  description:          'About the Bible',
  primary:              false,
  active:               false,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

puts '5 Categories Created'

########################
###       Tags       ###
########################
Tag.create!(
  name:                 'Active',
  slug:                 'active',
  description:          'An active tag',
  active:               true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Tag.create!(
  name:                 'Non-active',
  slug:                 'non-active',
  description:          'A non-active tag.',
  active:               false,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Tag.create!(
  name:                 'Blue',
  slug:                 'blue',
  description:          'The color blue',
  active:               true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Tag.create!(
  name:                 'Yellow',
  slug:                 'yellow',
  description:          'The color yellow',
  active:               true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Tag.create!(
  name:                 'Red',
  slug:                 'red',
  description:          'The color red',
  active:               true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Tag.create!(
  name:                 'Tag 6',
  slug:                 'tag-6',
  description:          'The sixth tag',
  active:               true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Tag.create!(
  name:                 'Tag 7',
  slug:                 'tag-7',
  description:          'The seventh tag',
  active:               true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Tag.create!(
  name:                 'Tag 8',
  slug:                 'tag-8',
  description:          'The eighth tag',
  active:               true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Tag.create!(
  name:                 'Tag 9',
  slug:                 'tag-9',
  description:          'The ninth tag',
  active:               true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Tag.create!(
  name:                 'Tag 10',
  slug:                 'tag-10',
  description:          'The tenth tag',
  active:               true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

puts '10 Tags Created'

########################
###      Posts       ###
########################
Post.create!(
  member_id:            1,
  title:                'First Post',
  slug:                 'first-post',
  image:                '',
  content:              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  status:               3,
  visibility:           2,
  password:             '',
  allow_comments:       true,
  archived:             true,
  subscription:         true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Post.create!(
  member_id:            1,
  title:                'Second Post',
  slug:                 'second-post',
  image:                '',
  content:              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  status:               3,
  visibility:           2,
  password:             '',
  allow_comments:       true,
  archived:             true,
  subscription:         true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Post.create!(
  member_id:            1,
  title:                'Third Post',
  slug:                 'third-post',
  image:                '',
  content:              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  status:               2,
  visibility:           1,
  password:             '',
  allow_comments:       true,
  archived:             true,
  subscription:         true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)


Post.create!(
  member_id:            1,
  title:                'Archived Post',
  slug:                 'archived-post',
  image:                '',
  content:              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  status:               3,
  visibility:           2,
  password:             '',
  allow_comments:       true,
  archived:             true,
  subscription:         true,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

puts '4 Posts Created'

########################
### Section-Post Map ###
########################
SectionPostMap.create!(
  section_id:           1,
  post_id:              1,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

SectionPostMap.create!(
  section_id:           1,
  post_id:              2,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

SectionPostMap.create!(
  section_id:           1,
  post_id:              3,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

SectionPostMap.create!(
  section_id:           2,
  post_id:              4,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

puts '4 Section-Post Maps Created'

########################
###   Category Map   ###
########################
CategoryMap.create!(
  category_id:          1,
  post_id:              1,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

CategoryMap.create!(
  category_id:          2,
  post_id:              2,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

CategoryMap.create!(
  category_id:          3,
  post_id:              3,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

CategoryMap.create!(
  category_id:          1,
  post_id:              4,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

puts '4 Category Maps Created'

########################
###     Tag Map      ###
########################

######## Post 1 ########
TagMap.create!(
  tag_id:               1,
  post_id:              1,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

TagMap.create!(
  tag_id:               3,
  post_id:              1,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

TagMap.create!(
  tag_id:               6,
  post_id:              1,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

TagMap.create!(
  tag_id:               8,
  post_id:              1,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

######## Post 2 ########

TagMap.create!(
  tag_id:               1,
  post_id:              2,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

TagMap.create!(
  tag_id:               3,
  post_id:              2,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

TagMap.create!(
  tag_id:               4,
  post_id:              2,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

TagMap.create!(
  tag_id:               5,
  post_id:              2,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

TagMap.create!(
  tag_id:               9,
  post_id:              2,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

######## Post 3 ########

TagMap.create!(
  tag_id:               1,
  post_id:              3,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

TagMap.create!(
  tag_id:               3,
  post_id:              3,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

TagMap.create!(
  tag_id:               6,
  post_id:              3,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

TagMap.create!(
  tag_id:               7,
  post_id:              3,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

######## Post 4 ########

TagMap.create!(
  tag_id:               7,
  post_id:              4,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

TagMap.create!(
  tag_id:               10,
  post_id:              4,
  created_at:           Time.now(),
  updated_at:           Time.now()
)

puts '15 Tag Maps Created'

########################
###   Comment Map    ###
########################

######## Post 1 ########
Comment.create!(
  member_id:            1,
  post_id:              1, 
  text:                 'This is a comment',
  created_at:           Time.now(),
  updated_at:           Time.now()
)

  Comment.create!(
    member_id:            2,
    post_id:              1, 
    comment_id:           1, 
    text:                 'This is a reply',
    created_at:           Time.now(),
    updated_at:           Time.now()
  )

    Comment.create!(
      member_id:            1,
      post_id:              1, 
      comment_id:           2, 
      text:                 'This is a reply to a reply',
      created_at:           Time.now(),
      updated_at:           Time.now()
    )

      Comment.create!(
        member_id:            2,
        post_id:              1, 
        comment_id:           3, 
        text:                 'This is a reply to a reply to a reply',
        created_at:           Time.now(),
        updated_at:           Time.now()
      )

Comment.create!(
  member_id:            2,
  post_id:              1, 
  text:                 'This is second comment',
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Comment.create!(
  member_id:            1,
  post_id:              1, 
  text:                 'This is third comment',
  created_at:           Time.now(),
  updated_at:           Time.now()
)

######## Post 2 ########
Comment.create!(
  member_id:            1,
  post_id:              2, 
  text:                 'This is a comment for post 2',
  created_at:           Time.now(),
  updated_at:           Time.now()
)

Comment.create!(
  member_id:            2,
  post_id:              2, 
  text:                 'This is a second comment for post 2',
  created_at:           Time.now(),
  updated_at:           Time.now()
)

######## Post 3 ########
Comment.create!(
  member_id:            1,
  post_id:              3, 
  text:                 'This is a comment for post 3',
  created_at:           Time.now(),
  updated_at:           Time.now()
)

######## Post 4 ########
Comment.create!(
  member_id:            1,
  post_id:              4, 
  text:                 'This is a comment for post 4',
  created_at:           Time.now(),
  updated_at:           Time.now()
)

puts '10 Comments Created'