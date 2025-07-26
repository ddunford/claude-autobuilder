const claude = require('@anthropic-ai/claude-code');
const { Agent } = claude;

class TesterAgent extends Agent {
    constructor() {
        super({
            name: 'tester',
            description: 'Implements and runs tests following pyramid strategy'
        });
    }

    async setup_test_environment(tech_specs) {
        const { testing } = tech_specs;
        
        // Setup test frameworks and dependencies
        await this.setup_test_frameworks(testing.frameworks);
        
        // Setup test directories
        await this.mkdir('src/tests/unit');
        await this.mkdir('src/tests/integration');
        await this.mkdir('src/tests/e2e');
    }

    async implement_unit_tests(components) {
        for (const [name, component] of Object.entries(components)) {
            await this.generate_unit_tests(name, component);
        }
    }

    async implement_integration_tests(architecture) {
        // Generate integration tests for component interactions
        await this.generate_integration_tests(architecture.components);
        
        // Generate API integration tests
        if (architecture.api_design) {
            await this.generate_api_tests(architecture.api_design);
        }
        
        // Generate database integration tests
        if (architecture.database) {
            await this.generate_db_tests(architecture.database);
        }
    }

    async implement_e2e_tests(tech_specs) {
        // Setup E2E test environment
        await this.setup_e2e_environment(tech_specs.testing);
        
        // Generate E2E test scenarios
        await this.generate_e2e_tests(tech_specs);
    }

    async run_tests() {
        // Run unit tests
        await this.run_unit_tests();
        
        // Run integration tests
        await this.run_integration_tests();
        
        // Run E2E tests
        await this.run_e2e_tests();
    }

    async generate_coverage_report() {
        await this.generate_test_coverage();
        await this.validate_coverage_requirements();
    }

    async run() {
        try {
            // Read technical specifications
            const tech_specs = await this.readJson('build/temp/tech_specs.json');
            
            // Setup test environment
            await this.setup_test_environment(tech_specs);
            
            // Implement tests
            await this.implement_unit_tests(tech_specs.components);
            await this.implement_integration_tests(tech_specs.architecture);
            await this.implement_e2e_tests(tech_specs);
            
            // Run all tests
            await this.run_tests();
            
            // Generate coverage report
            await this.generate_coverage_report();
            
            this.log('✅ Testing completed');
            
        } catch (error) {
            this.error('Failed to complete testing:', error);
            throw error;
        }
    }
}

module.exports = TesterAgent; 