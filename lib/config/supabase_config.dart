// Supabase Configuration Settings
// Add this file to .gitignore and write your real values here
// Example: Get from .env file or environment variables

class SupabaseConfig {
  // Write your Supabase project URL here
  static const String url = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'YOUR_SUPABASE_PROJECT_URL_HERE',
  );

  // Write your Supabase anon key here
  static const String anonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: 'YOUR_SUPABASE_ANON_KEY_HERE',
  );
}

// USAGE INSTRUCTIONS:
// 1. Go to https://supabase.com
// 2. Sign in or create an account
// 3. Click "New Project" button
// 4. Set project name and database password
// 5. After project creation, go to "Settings" > "API" tab
// 6. Copy "Project URL" and "anon public" key
// 7. Use these values with one of the following methods:
//
// METHOD 1 - Environment Variables (Recommended):
// Run these commands in terminal:
// export SUPABASE_URL="https://your-project.supabase.co"
// export SUPABASE_ANON_KEY="your-anon-key-here"
//
// METHOD 2 - .env file:
// Create .env file in project root:
// SUPABASE_URL=https://your-project.supabase.co
// SUPABASE_ANON_KEY=your-anon-key-here
//
// METHOD 3 - Write values directly (For development):
// Write real values in 'defaultValue' fields above
//
// SECURITY: Add this file to .gitignore and never push real keys
// to GitHub!
