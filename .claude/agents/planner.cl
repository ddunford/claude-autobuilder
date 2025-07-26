const claude = require('@anthropic-ai/claude-code');
const { Agent, Requirements } = claude;

class PlannerAgent extends Agent {
    constructor() {
        super({
            name: 'planner',
            description: 'Analyzes requirements and creates specifications'
        });
    }

    async analyze_requirements(prompt) {
        const requirements = new Requirements();
        
        // Use Claude's natural language understanding
        const parsed = await this.claude.parse_requirements(prompt);
        
        // Extract requirements
        requirements.functional = await parsed.getFunctionalRequirements();
        requirements.non_functional = [
            'Performance',
            'Security', 
            'Scalability',
            'Maintainability'
        ];
        requirements.constraints = [
            'All code must be in ./src directory',
            'Must follow industry best practices',
            'Must include comprehensive testing'
        ];
        requirements.user_stories = await parsed.generateUserStories();
        
        return requirements;
    }

    async generate_initial_specs(requirements) {
        const specs = {
            project_type: await this.determine_project_type(requirements),
            architecture: await this.recommend_architecture(requirements),
            tech_stack: await this.recommend_tech_stack(requirements),
            deployment: {
                containerization: 'docker',
                orchestration: await this.determine_if_needed(requirements)
            },
            testing_strategy: {
                unit_testing: true,
                integration_testing: true,
                e2e_testing: true,
                test_framework: await this.recommend_test_framework(requirements)
            }
        };
        
        return specs;
    }

    async run() {
        try {
            // Read prompt
            const prompt = await this.readFile('build/temp/current_prompt.txt');
            
            // Analyze requirements
            const requirements = await this.analyze_requirements(prompt);
            
            // Generate specs
            const specs = await this.generate_initial_specs(requirements);
            
            // Write specs for architect
            await this.writeJson('build/temp/arch_specs.json', specs);
            
            this.log('✅ Planning phase completed');
            
        } catch (error) {
            this.error('Failed to complete planning phase:', error);
            throw error;
        }
    }
}

module.exports = PlannerAgent; 