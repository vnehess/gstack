# Salesforce Development with gstack in Windsurf/Cascade

This guide documents how to use gstack's browser automation capabilities for Salesforce development within the Windsurf/Cascade environment.

## Overview

gstack provides Claude Code agents with "eyes" to see and interact with web applications through browser automation. For Salesforce developers, this enables automated UI testing, flow validation, and integration testing directly from your development environment.

## Installation

```bash
git clone https://github.com/vnehess/gstack.git ~/.claude/skills/gstack && cd ~/.claude/skills/gstack && ./setup
```

## Salesforce-Specific Setup

### 1. Import Browser Session
```bash
/setup-browser-cookies [your-dev-org].my.salesforce.com
```

This imports your existing Salesforce login session so the browser automation can access authenticated pages.

### 2. Test Browser Access
```bash
/browse [your-dev-org].my.salesforce.com
```

## Use Cases for Salesforce Development

### UI Testing and Validation
- Test Visualforce pages and Lightning Web Components
- Validate record layouts and field updates
- Verify flow screen flows work correctly
- Check custom button and link functionality

### Integration Testing
- End-to-end testing of automation (flows, triggers, process builder)
- Validate data integration between objects
- Test approval processes and email alerts
- Verify file upload and document generation

### Regression Testing
- Compare UI behavior before/after deployments
- Validate that configuration changes don't break existing functionality
- Test mobile vs desktop experiences

## Example Workflows

### Testing a New Flow
```bash
# After creating a new flow in Flow Builder
/browse [your-org].my.salesforce.com/lightning/setup/Flows/home
# Navigate to the flow, activate it, then test the flow execution
```

### Validating LWC Components
```bash
# After deploying a new Lightning Web Component
/browse [your-org].my.salesforce.com/lightning/n/[your_lwc_page]
# Take screenshots and verify component renders correctly
```

### Testing Record Page Layouts
```bash
# After modifying page layouts
/browse [your-org].my.salesforce.com/lightning/r/[object_name]/view
# Verify field visibility, sections, and related lists
```

## Integration with GoogleSheetsConnector

The gstack browser automation complements the GoogleSheetsConnector project by enabling:

1. **Visual Testing** - Verify that data synced from Google Sheets displays correctly in Salesforce
2. **Flow Validation** - Test automation that triggers from Google Sheets integration
3. **Permission Testing** - Validate that permission sets created via API work as expected in the UI
4. **User Experience Testing** - Ensure the integration provides a smooth user experience

## Key gstack Skills for Salesforce

| Skill | Use Case | Example |
|-------|----------|---------|
| `/browse` | Navigate and interact with Salesforce UI | Test record pages, flows, VF pages |
| `/qa` | Automated testing of changes | Test deployment impact |
| `/setup-browser-cookies` | Import Salesforce session | Enable authenticated testing |
| `/review` | Code review for Apex/LWC | Review metadata changes |
| `/plan-eng-review` | Architecture planning | Plan complex integrations |

## Limitations

- **Backend Logic**: Cannot directly test Apex code execution, trigger logic, or database operations
- **API Testing**: Limited to what's accessible through the web interface
- **Performance**: Browser automation is slower than direct API calls
- **Security**: Use with care in production environments - this is a real browser with real session state

## Best Practices

1. **Use Sandbox Environments** - Always test in sandbox before production
2. **Clean Session State** - Clear browser cookies between different org testing
3. **Document Test Cases** - Use `/retro` to track test results over time
4. **Combine with API Testing** - Use browser testing for UI, API testing for backend logic
5. **Version Control** - Store test results and screenshots in git for audit trails

## Troubleshooting

### Browser Session Issues
```bash
# Clear cookies and re-authenticate
/setup-browser-cookies [your-org].my.salesforce.com --clear
```

### Slow Performance
- Use `--quick` flag for smoke tests: `/qa --quick`
- Limit testing to specific pages rather than full org exploration

### Authentication Problems
- Ensure your Salesforce session is active in Chrome
- Check that you're not hitting session timeouts
- Verify IP restrictions and login policies

## Example Salesforce Test Script

```bash
# Complete test cycle for a new feature
/plan-eng-review  # Plan the testing approach
/browse [org].my.salesforce.com  # Navigate to feature
/qa  # Run automated tests
/retro  # Document results
```

## Windsurf/Cascade Integration

This setup works seamlessly within the Windsurf/Cascade environment:

- **File Context**: Cascade can read your Salesforce metadata files alongside browser testing
- **Multi-tool Coordination**: Combine file edits with UI validation in the same session
- **Persistent State**: Browser session remains active across multiple Cascade interactions
- **Integrated Debugging**: Fix code in editor, test immediately in browser

## Contributing

When extending gstack for Salesforce use cases:

1. Add Salesforce-specific prompts to the skill files
2. Create custom test scripts for common Salesforce patterns
3. Document new workflows in this README
4. Share test templates with the team

---

**Note**: This is a fork of gstack specifically enhanced for Salesforce development workflows. For the original gstack documentation, see the main repository.
