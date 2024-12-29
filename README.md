# Biomarker Project

This is a monorepo containing both the backend Rails API and the mobile application for the Biomarker tracking system.

## Project Structure

- `backend/` - Ruby on Rails API application
- `mobile/` - React Native mobile app built with Expo

## Getting Started

### Backend (Rails API)

1. Navigate to the backend directory:

```bash
cd backend
```

2. Install dependencies:

```bash
bundle install
```

3. Set up the database:

```bash
rails db:setup
```

4. Start the Rails server:

```bash
bin/dev
```

### Mobile App (Expo)

1. Navigate to the mobile directory:

```bash
cd mobile
```

2. Install dependencies:

```bash
npm install
```

3. Start the Expo development server:

```bash
npx expo start
```

## Development

- The backend API runs on `http://localhost:3000`
- The mobile app will connect to the backend API
- Make sure both applications are running for full functionality

## Contributing

Please refer to the individual README files in each directory for specific development guidelines and setup instructions.
