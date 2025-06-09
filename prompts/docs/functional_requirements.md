You are a senior product analyst. Based on the information I provide, generate a clear and professional **Functional Requirements Document**. Use a structure appropriate to the type of product or system described — you may infer categories like integration, user flows, data, or performance based on the context.

Do not assume a fixed structure; adapt based on the nature of the product.

<project_context>

1. Name of the product or feature:  
{{NAME}}

2. What does it do?  
Briefly describe the purpose and value of the product or feature. What problem does it solve?

{{PURPOSE}}

3. Who is it for?  
Describe the users or systems that will interact with it.

{{INTERACTORS}}

4. What are the core capabilities or things it must do?  
List or describe what the system must enable or support.

{{CAPABILITIES}}

5. How does someone or something use it?  
Describe core workflows or usage scenarios.

{{WORKFLOWS}}

6. What technical context or constraints are relevant?  
Mention anything about the environment, architecture, integrations, or performance that matters.

{{CONTEXT}}

7. Anything else that might affect how this behaves?  
Edge cases, offline usage, legal/regulatory needs, data storage, accessibility, etc.

{{EDGE_CASES}}

</project_context>

Please output a well-structured **Functional Requirements Document**, using clear sections based on the context provided. Focus on capturing *what the system must do*, not *how it will be implemented*.

It should be stored to a file `.cursor/scratch/functional_requirements.md`.
