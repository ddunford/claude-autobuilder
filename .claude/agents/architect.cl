const claude = require('@anthropic-ai/claude-code');
const { Agent } = claude;

class ArchitectAgent extends Agent {
    constructor() {
        super({
            name: 'architect',
            description: 'Designs system architecture and technical specifications'
        });
    }

    async analyze_architecture_requirements(specs) {
        const project_type = specs.project_type;
        const scale = await this.determine_scale(specs);
        const complexity = await this.analyze_complexity(specs);
        
        return {
            project_type,
            scale,
            complexity
        };
    }

    async design_architecture(analysis) {
        const architecture = {
            pattern: await this.select_architectural_pattern(analysis),
            components: await this.define_components(analysis),
            data_flow: await this.design_data_flow(analysis),
            api_design: await this.design_apis(analysis),
            database: await this.select_database(analysis),
            security: await this.define_security_measures(analysis)
        };
        
        return architecture;
    }

    async select_tech_stack(architecture) {
        return {
            frontend: await this.select_frontend_tech(architecture),
            backend: await this.select_backend_tech(architecture),
            database: await this.select_database_tech(architecture),
            testing: await this.select_testing_tech(architecture),
            deployment: {
                containerization: 'docker',
                orchestration: await this.select_orchestration(architecture),
                ci_cd: await this.define_ci_cd(architecture)
            }
        };
    }

    async generate_technical_specs(architecture, tech_stack) {
        return {
            architecture,
            tech_stack,
            components: Object.fromEntries(
                architecture.components.map(comp => [
                    comp.name,
                    {
                        description: comp.description,
                        tech: comp.technology,
                        interfaces: comp.interfaces,
                        dependencies: comp.dependencies
                    }
                ])
            ),
            deployment: {
                requirements: await this.define_deployment_requirements(architecture),
                configuration: await this.generate_deployment_config(tech_stack),
                scaling: await this.define_scaling_strategy(architecture)
            },
            testing: {
                strategy: await this.define_testing_strategy(architecture),
                frameworks: tech_stack.testing,
                coverage_requirements: await this.define_coverage_requirements()
            }
        };
    }

    async run() {
        try {
            // Read architectural specs from planner
            const specs = await this.readJson('build/temp/arch_specs.json');
            
            // Analyze requirements
            const analysis = await this.analyze_architecture_requirements(specs);
            
            // Design architecture
            const architecture = await this.design_architecture(analysis);
            
            // Select tech stack
            const tech_stack = await this.select_tech_stack(architecture);
            
            // Generate technical specifications
            const tech_specs = await this.generate_technical_specs(architecture, tech_stack);
            
            // Write technical specs for builder agent
            await this.writeJson('build/temp/tech_specs.json', tech_specs);
            
            this.log('✅ Architecture design completed');
            
        } catch (error) {
            this.error('Failed to complete architecture design:', error);
            throw error;
        }
    }
}

module.exports = ArchitectAgent; 